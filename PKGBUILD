# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=act3-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Glance at the last 3 runs of your GitHub Actions workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/dhth/act3"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/act3_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/act3_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d18e9590cb08390442b5e97bfeb148cee6686f829e788fc8f9395148ce192642')
sha256sums_aarch64=('c2c3bab9097a91a29daf376db0d65498db2f47cf60d270eaa06a6da495c15d52')

package() {
  install -Dm755 "act3" "${pkgdir}/usr/bin/act3"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
