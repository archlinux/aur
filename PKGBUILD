# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rimz-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Real-time dashboard for agentic coding on tmux"
arch=('x86_64')
url="https://github.com/rimio-ai/rimz"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rimio-ai/rimz/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rimz-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b0380183e650ca5fa5c7763b06fc19893b520717432abdb718368373b0407dfc')
sha256sums_x86_64=('a49d74002f78838c8928e76da258615de6d2dac3598c1e0d33868cdd485f025d')

package() {
  install -Dm755 "rimz-x86_64-unknown-linux-gnu/rimz" "${pkgdir}/usr/bin/rimz"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
