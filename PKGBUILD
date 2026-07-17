# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf-bin
_reponame=TermPDF
_executable=termpdf
pkgver=0.4.2
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
sha256sums_x86_64=('46f778124ade5f58ce0bec5f34bf03a408093849ce1ef050aa7325299c488d2a')
sha256sums_aarch64=('13f82940269726fd41a6160304c5705f3b6172bf123431b00804a1f7c8aa3bb5')

package() {
    cd "${srcdir}/termpdf-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_executable}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
