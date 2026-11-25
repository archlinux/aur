# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gogg-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A multiplatform game file downloader for GOG"
arch=('x86_64' 'aarch64')
url="https://github.com/habedi/gogg"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libglvnd' 'libx11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/habedi/gogg/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gogg-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/gogg-linux-arm64.zip")
sha256sums=('dc49155c3d9e9284a51a392dbb130a66d873fe2279c870cce3311c16a8b34330')
sha256sums_x86_64=('5e288d3bada56bd40573230eb0d8c3cf0d6fc324e527f483824162959bf1a141')
sha256sums_aarch64=('eda7d96b818fcc9b23964fa39dfb9e84cbf0d0c722e855793e7bab0d037dae17')

package() {
  install -Dm755 "gogg" "${pkgdir}/usr/bin/gogg"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
