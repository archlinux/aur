# Maintainer: aksr <aksr at t-com dot me>
pkgname=otf-euler-git
pkgver=r238.6c76de4
pkgrel=1
epoch=
pkgdesc="An OpenType/Unicode math port of AMS Euler font."
arch=('any')
url="https://github.com/khaledhosny/euler-otf"
license=('OFL')
groups=()
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=otf.install
source=("$pkgname::git+https://github.com/khaledhosny/euler-otf.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 euler.otf $pkgdir/usr/share/fonts/OTF/euler.otf
  install -Dm644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

