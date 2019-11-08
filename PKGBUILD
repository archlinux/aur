# Maintainer: aksr <aksr at t-com dot me>
pkgname=fforth-git
pkgver=r23.9cb7e2a
pkgrel=2
epoch=
pkgdesc="A small, portable Forth written in Posix C"
arch=('i686' 'x86_64')
url="https://github.com/davidgiven/fforth"
license=('BSD')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
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
  install -D -m775 fforth $pkgdir/usr/bin/fforth
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

