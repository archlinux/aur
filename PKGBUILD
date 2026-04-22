# Maintainer: NormalAlkene <NormalAlkene at outlook dot com>
pkgname=tpdf-bin
_reponame=TermPDF
_executable=termpdf
pkgver=0.1.1
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
sha256sums_x86_64=('b47feee17d896cd8ec6bda2485600ff12335e269d058202be8a5243e9716be5f')
sha256sums_aarch64=('689bad899aa6779686ce921eb805426d972706634fa5a315027647a9835727e2')

package() {
    cd "${srcdir}/termpdf-${pkgver}-${CARCH}-unknown-linux-gnu"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_executable}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
