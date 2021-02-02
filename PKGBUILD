# Maintainer: David Ellis <david@alantechnologies.com>
# Thanks to Andy Kluger <https://t.me/andykluger> for the initial version of this!
pkgname=alan
pkgver=0.1.26
pkgrel=1
pkgdesc="The Alan programming language compiler and runtime"
url="https://github.com/alantech/alan"
license=('AGPL3' 'Apache')
arch=('x86_64')
depends=()
makedepends=(git nodejs rust yarn npm)
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1e1235a982b019709150e07d7aabf29f175e61dcee385a1d04b0eb37abd200a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./avm/target/release/alan "${pkgdir}/usr/bin/alan"
}
