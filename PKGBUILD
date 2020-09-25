# Maintainer: Andy Kluger <https://t.me/andykluger>
pkgname=alan
pkgver=0.1.9
pkgrel=1
pkgdesc="The Alan programming language compiler and runtime"
url="https://github.com/alantech/alan"
license=('AGPL3' 'Apache')
arch=('x86_64')
depends=()
makedepends=(git nodejs-lts-erbium rust python2)
# optdepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('167335ee013d02eda97f0e8147dfbfa1a64428ab305f70c373b329f9fe5339b6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  cp ./avm/target/release/alan "${pkgdir}/usr/bin/alan"
}
