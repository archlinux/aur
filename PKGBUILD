# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=neva-bin
pkgver=0.41.0
pkgrel=1
pkgdesc="Dataflow programming language with message-passing graphs that run in parallel by default"
arch=('x86_64' 'aarch64')
url="https://github.com/nevalang/neva"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nevalang/neva/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/neva-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/neva-linux-arm64")
sha256sums=('d2416e11c5655e4f07ac92d6dc7dda5bbfdd5bb40e24f0ebbecf20bbc1f233f0')
sha256sums_x86_64=('1a14dc4e68253936a6181136aac3b2f3ad19a6e51958985ea3e109683dcee26a')
sha256sums_aarch64=('b3307336aadfc158007e2e02782cfdd66f1eb19f2f0f1b4c1c5deb8454a66d11')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/neva"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
