# Maintainer: aksr <aksr at t-com dot me>
pkgname=rirc-git
pkgver=r304.5c01735
pkgrel=1
epoch=
pkgdesc="A terminal IRC client in C."
arch=('i686' 'x86_64')
url="https://github.com/rcr/rirc"
license=('MIT')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/rcr/rirc")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 rirc $pkgdir/usr/bin/rirc
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README
}

