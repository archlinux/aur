# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=uptrace-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Open source APM: OpenTelemetry traces, metrics, and logs"
arch=('x86_64' 'aarch64')
url="https://github.com/uptrace/uptrace"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/uptrace/uptrace/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/uptrace_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/uptrace_linux_arm64")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('4a8a20e2db33b241e12600cc17c4a899089c6b1dbb95fd455740c0e96bd61475')
sha256sums_aarch64=('fb1031a5decc13667237c828e8ab0a0aab025e131a129284d2115e19591f2d1e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/uptrace"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
