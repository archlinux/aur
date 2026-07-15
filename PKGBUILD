# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf-bin
_reponame=TermPDF
_executable=termpdf
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal PDF viewer written in Rust, with vim key-bindings and watch mode."
arch=('x86_64' 'aarch64')
url="https://www.github.com/NiJingzhe/${_reponame}"
license=('MIT')
depends=('libpdfium')
provides=('tpdf')
conflicts=('tpdf' 'tpdf-git')
source_x86_64=("${url}/releases/download/v${pkgver}/termpdf-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/termpdf-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d881080121b9c174b97ed9c3372273d810d9933f7df7968ac16e575f681f4775')
sha256sums_aarch64=('46b4d90f3007d948463e4973c8c5d8f18fd20cc2b35889211c53d3c12cb62d58')

package() {
    cd "${srcdir}/termpdf-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_executable}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
