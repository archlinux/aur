# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joshua Li <josh@jrl.ninja>

pkgname=vape
pkgver=0.3.1
pkgrel=1
pkgdesc="A command-line tool that converts text into 'vaporwave' text - fullwidth UTF-8 characters."
arch=('x86_64')
url="https://github.com/JoshuaRLi/vape"
license=('MIT')
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('e40ebf822bd0f14f45d1a7acf51ea83e')

build () {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package () {
  install -Dm755 "${pkgname}-${pkgver}/target/release/vape" "${pkgdir}/usr/bin/vape"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}