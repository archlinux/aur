# Maintainer: aksr <aksr at t-com dot me>
pkgname=irssi-scripts-git
pkgver=r640.db22de1
pkgrel=1
epoch=
pkgdesc="Scripts for Irssi \"http://scripts.irssi.org\""
arch=('i686' 'x86_64')
url="https://github.com/irssi/scripts.irssi.org"
license=('various')
groups=()
depends=('irssi' 'perl')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('irssi-scripts')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/irssi/scripts.irssi.org.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname/scripts"
  mkdir -p "$pkgdir/usr/share/irssi/scripts"
  cp -r * $pkgdir/usr/share/irssi/scripts
}

