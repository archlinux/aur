# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=air-bin
pkgver=1.27.8
pkgrel=2
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${pkgname%-bin}"
arch=('x86_64' 'i686' 'aarch64')
license=(GPL3)
depends=(go)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname/-bin/}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname/-bin/}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname/-bin/}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('77ea75459a700cea94b3d32a2b1bdcf781574298ae86afc7cef5c64bbdb79ece')
sha256sums_i686=('56aa56b7bb919e6dc1b15109a78035d9d64c5a2d5afca5b1f25a52aaa40d57dc')
sha256sums_aarch64=('4abe879e3a0ff8e1659b60b2fc8f869b80bddaefb26129b16751de9b01e954c8')

package() {
  install -Dvm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
