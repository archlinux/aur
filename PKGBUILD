# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=container-canary-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Test and validate container images against versioned requirement manifests"
arch=('x86_64' 'aarch64')
url="https://github.com/NVIDIA/container-canary"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/NVIDIA/container-canary/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/canary_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/canary_linux_arm64")
sha256sums=('558d6a5b7e197abed22fa40044fd4cf2fef70a1241b881383b446272a0fbbb1b')
sha256sums_x86_64=('6af018033f2634f1b6abd7d521e20497d0028a47b8b405ee76a8d8177cbb5703')
sha256sums_aarch64=('039d30789d764b75339ba299558b8de2531ebb70ec057d94b6cd3b206f51f023')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/canary"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
