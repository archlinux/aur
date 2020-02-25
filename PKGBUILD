# Maintainer: mutlu_inek <mutlu_inek@yahoo.de>

_name=mouse-follows-focus
pkgname=python-$_name
pkgver=r3.520a7ac
pkgrel=1
pkgdesc="WM-independent python script that implements mouse-follows-focus functionality and plays well with focus-follows-mouse"
arch=(any)
url="https://github.com/setzer22/$_name"
license=('MIT')

groups=()
depends=('python-xlib')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_gitroot="https://github.com/setzer22/$_name.git"
_gitname="$_name"
source=("$_gitname::git+$_gitroot"
	"$_name.sh")

noextract=()
md5sums=('SKIP'
	 'd1acedd88c5799ac27a095ec2bd05333')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name.sh"

  cd "$srcdir/$_name"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 $_name.py "$pkgdir/usr/share/$pkgname/$_name.py"
}

