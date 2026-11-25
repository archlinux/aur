# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=simple-one-api-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Single-binary adapter exposing many LLM provider APIs through an OpenAI-compatible interface"
arch=('x86_64' 'aarch64')
url="https://github.com/fruitbars/simple-one-api"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fruitbars/simple-one-api/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/simple-one-api-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/simple-one-api-linux-arm64.tar.gz")
sha256sums=('e57eaaec2de2064d725e814ebcd42d22b071e6ee2888f77bbcb8ae81243bb74a')
sha256sums_x86_64=('14518a05b430cf110eaaeb424ec6c18b960f7b0db66acc9676e80bcd502cb5ee')
sha256sums_aarch64=('77b8db87feb646e05168535caa2ce72f4af44a9a4f8c19abb56a1fa7076dfbfe')

package() {
  install -Dm755 "simple-one-api" "${pkgdir}/usr/bin/simple-one-api"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
