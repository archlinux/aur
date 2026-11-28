# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=azure-devops-exporter-bin
pkgver=26.10.0
pkgrel=1
pkgdesc="Prometheus exporter for Azure DevOps"
arch=('x86_64' 'aarch64')
url="https://github.com/webdevops/azure-devops-exporter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/webdevops/azure-devops-exporter/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/azure-devops-exporter.linux.amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/azure-devops-exporter.linux.arm64")
sha256sums=('bcdcdd5d04d627a4a545ce7a97e4cf38747d7b839a61185e9a5c085a0bbdba35')
sha256sums_x86_64=('de137b3588fa1140fd5be05551e9a642e99941087efc371f0b593ed395dbb36d')
sha256sums_aarch64=('252ee175621414897d4a00cc6623ead74aa3e1281fdf2acf6fb44b29f0685136')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/azure-devops-exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
