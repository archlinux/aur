# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=exportarr-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Prometheus exporter for Sonarr, Radarr, Lidarr, Prowlarr, Bazarr and SABnzbd"
arch=('x86_64' 'aarch64')
url="https://github.com/onedr0p/exportarr"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/onedr0p/exportarr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/exportarr_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/exportarr_${pkgver}_linux_arm64.tar.gz")
sha256sums=('46189f98e672ef4fbec0166e9c12132b41f21dab829e89b42f2907407d279ba7')
sha256sums_x86_64=('57dfe9c346247fdf0a5a69453818d11564122f7e7677216ea8d0f98fb9b45edc')
sha256sums_aarch64=('1767242e035038e9b8e06f4d572ba8de390e84a7b3bb9c54cc547e8b38e6df99')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="exportarr_${pkgver}_linux_amd64" ;;
    aarch64) _dir="exportarr_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/exportarr" "${pkgdir}/usr/bin/exportarr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
