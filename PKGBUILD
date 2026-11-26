# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=file.d-bin
pkgver=0.88.0
pkgrel=1
pkgdesc="Fast tool for building data pipelines that read, process and output events"
arch=('x86_64' 'aarch64')
url="https://github.com/ozontech/file.d"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/file.d_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/file.d_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c982767584f8c7986233b748c532b08be1e61cb6f8d0f44052870611f2351eb7')
sha256sums_aarch64=('76033cc1d4a76589529d3d754490a696e2ae11cefaa3d6f618ac530ac447f491')

package() {
  install -Dm755 "file.d" "${pkgdir}/usr/bin/file.d"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
