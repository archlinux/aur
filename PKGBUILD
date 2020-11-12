# Maintainer: David Ellis <david@alantechnologies.com>
# Thanks to Andy Kluger <https://t.me/andykluger> for the initial version of this!
pkgname=alan
pkgver=0.1.15
pkgrel=1
pkgdesc="The Alan programming language compiler and runtime"
url="https://github.com/alantech/alan"
license=('AGPL3' 'Apache')
arch=('x86_64')
depends=()
makedepends=(git nodejs-lts-erbium rust python2 yarn npm)
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('41b3e9cb02ea5974ebe140b7c57f052ff92a70e21fcfe44b9cc4f7d6902acfdb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./avm/target/release/alan "${pkgdir}/usr/bin/alan"
}
