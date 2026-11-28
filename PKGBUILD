# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=noctx-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Find Go function calls made without context.Context"
arch=('x86_64' 'aarch64')
url="https://github.com/sonatard/noctx"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/noctx_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/noctx_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d531dbbda3b8864517d423f92b6bc0167a6efb4165036ba92ff24cc55de381d3')
sha256sums_aarch64=('863ddc3bb88abaa84e895a30bb6f030dfac75fc0cdc7c0e837ca6d5c12649983')

package() {
  install -Dm755 "noctx" "${pkgdir}/usr/bin/noctx"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
