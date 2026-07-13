# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf-bin
_reponame=TermPDF
_executable=termpdf
pkgver=0.3.1
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
sha256sums_x86_64=('bd903055878b07ebd9c93be5d40f474e4432361f8f48395cbf2889594ea5f807')
sha256sums_aarch64=('78e595b4f9fc1cb9bb8b240affacfcc858d267e1250a6de2d347df3fa3372cb3')

package() {
    cd "${srcdir}/termpdf-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_executable}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
