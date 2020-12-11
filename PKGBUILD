# Maintainer: David Ellis <david@alantechnologies.com>
# Thanks to Andy Kluger <https://t.me/andykluger> for the initial version of this!
pkgname=alan
pkgver=0.1.21
pkgrel=1
pkgdesc="The Alan programming language compiler and runtime"
url="https://github.com/alantech/alan"
license=('AGPL3' 'Apache')
arch=('x86_64')
depends=()
makedepends=(git nodejs-lts-erbium rust python2 yarn npm)
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('63b239c79be73524a5bf9cabc9d098ca2abeeb3427754c3a5ab42a961a4138e6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./avm/target/release/alan "${pkgdir}/usr/bin/alan"
}
