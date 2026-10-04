# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf-bin
_reponame=TermPDF
_executable=termpdf
pkgver=0.5.0
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
sha256sums_x86_64=('c8258e39e58d2b3623663f3a2184b7e53e5c780633f2772d1923cd079af24e79')
sha256sums_aarch64=('d443597926fce0f0ee0f00136babee3775662829191dd92c860a67a94bf753ac')

package() {
    cd "${srcdir}/termpdf-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_executable}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
