# Maintainer: Hugo Courtial <hugo@courtial.me>
pkgname=spasm-ng-git
pkgver=v0.5.beta.2.63.g61d8ff5
pkgrel=1
pkgdesc="z80 assembler with extra features for TI calculators"
arch=('any')
url="https://github.com/alberthdev/spasm-ng"
license=('GPL')
depends=('gmp' 'openssl')
makedepends=('gcc' 'make')
source=('spasm-ng::git://github.com/alberthdev/spasm-ng')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/spasm-ng"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/spasm-ng"
  make version opt spasm
}

package() {
  export DESTDIR="$pkgdir/usr"
  mkdir -p "$pkgdir/usr/bin"
  cd "${srcdir}/spasm-ng"
  make install
}
