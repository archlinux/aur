# Maintainer: Andy Kluger <https://t.me/andykluger>
pkgname=alan
pkgver=0.1.8
pkgrel=1
pkgdesc="The Alan programming language compiler and runtime"
url="https://github.com/alantech/alan"
license=('AGPL3' 'Apache')
arch=('x86_64')
depends=()
makedepends=(git nodejs-lts-erbium rust python2)
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7c4bdaf4ea441c753bd82c85f90fc66da6e5737fc0b55fd872e49b624aa3c6bb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./avm/target/release/alan "${pkgdir}/usr/bin/alan"
}
