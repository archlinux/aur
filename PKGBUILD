# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=show-me-the-story-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="Self-hosted AI novel writer with a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/Nigh/show-me-the-story"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Nigh/show-me-the-story/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/show-me-the-story-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/show-me-the-story-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('c7906f2d4b129a28dffe2920b39cb648dd5bf4bd7ed5bb090cbc9cba16e23279')
sha256sums_x86_64=('92bb2649f83a990a801139aab124e2546c787263e376d503a9655ffbc181e047')
sha256sums_aarch64=('7b496c03247be935dc3aff99029c8e0efbb036a6d1b61fd1f704888bc2d491e3')

package() {
  install -Dm755 "show-me-the-story" "${pkgdir}/usr/bin/show-me-the-story"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
