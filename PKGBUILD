# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openserp-bin
pkgver=0.8.22
pkgrel=1
pkgdesc="Self-hosted web search for AI agents and SEO. Google, Bing, Yandex, Baidu, DuckDuckGo & Ecosia, rendered in a real browser: ranked results and clean page Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/karust/openserp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/karust/openserp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/openserp-linux-amd64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/openserp-linux-arm64-${pkgver}.tgz")
sha256sums=('b9d115fd46f6a68dcf99a7174731daaa54364244f4a1884eadee426252c0af38')
sha256sums_x86_64=('1ff03e489103b72a29978698fab979f8329f7111f38fecb69256fe942b6ab10e')
sha256sums_aarch64=('0d8e95d86562b148176e93efb46a4fb82924694bc7a4a4669f943510b438dacb')

package() {
  install -Dm755 "openserp" "${pkgdir}/usr/bin/openserp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
