# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=prusa_exporter-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Prometheus exporter for Prusa 3D printers"
arch=('x86_64' 'aarch64')
url="https://github.com/pubeldev/prusa_exporter"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pubeldev/prusa_exporter/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/prusa_exporter-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/prusa_exporter-linux-arm64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('67b0a5704023905e73658b5c5f3fc3c10c302031d92a4301169bfa94839ec344')
sha256sums_aarch64=('5b0141b7cb55c51567e1c242e1768d5f124c983c88de05c7fe7108ed329e7719')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/prusa_exporter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
