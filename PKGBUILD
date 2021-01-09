# Maintainer: David Ellis <david@alantechnologies.com>
# Thanks to Andy Kluger <https://t.me/andykluger> for the initial version of this!
pkgname=alan
pkgver=0.1.24
pkgrel=1
pkgdesc="The Alan programming language compiler and runtime"
url="https://github.com/alantech/alan"
license=('AGPL3' 'Apache')
arch=('x86_64')
depends=()
makedepends=(git nodejs-lts-erbium rust yarn npm)
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('45ab5895118eafc6d9290c9d5cef514fb9223c17640d5550290eedcab5cb2be4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./avm/target/release/alan "${pkgdir}/usr/bin/alan"
}
