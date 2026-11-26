# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=script_exporter-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="Prometheus exporter that runs scripts and collects metrics from their output"
arch=('x86_64' 'aarch64')
url="https://github.com/ricoberger/script_exporter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ricoberger/script_exporter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/script_exporter-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/script_exporter-linux-arm64.tar.gz")
sha256sums=('7da7a3ddaff23e9841c73643f3b2e1fa35476933c1883ffdf54bf9422111b8a8')
sha256sums_x86_64=('1d09330a18e87afdda5b59070cd946fa149e40015959c8de18735cd6befbec19')
sha256sums_aarch64=('40dc64f096d505f6aaeb73c81c4ba34c32ac539eeaf2b997779b1165f18db9b7')

package() {
  install -Dm755 "script_exporter" "${pkgdir}/usr/bin/script_exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
