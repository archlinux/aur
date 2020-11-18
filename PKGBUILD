# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joshua Li <josh@jrl.ninja>

pkgname=vape
pkgver=0.4.0
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
url="https://github.com/JoshuaRLi/vape"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f6c9a86df88bb73ea3cba5a8da2c1ffe4895b4e028ea4aad6f918cbc0c7dd124')

build () {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package () {
  install -Dm755 "${pkgname}-${pkgver}/target/release/vape" "${pkgdir}/usr/bin/vape"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
