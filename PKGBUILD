# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=air-bin
pkgver=1.40.4
pkgrel=1
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

sha256sums_x86_64=('7be1a612539aa43daf77d420cb4b337a979bb7de2ae56f852b1d3bda63338273')
sha256sums_i686=('dbb92949549226be9aa814dd99c1ccec75d41759f66e0a2b61a5a5d97a016cff')
sha256sums_aarch64=('06f0caf2dc75efa79ef6af8bb89a406fbf13f7e82d294005937060f42633dc20')

package() {
  install -Dvm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
