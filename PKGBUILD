# Maintainer: Stephan Meijer <docspec@stephanmeijer.com>
pkgname=docspec-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="Document conversion tool - DOCX to HTML, EPUB, and more"
arch=('x86_64' 'aarch64')
url="https://github.com/docspec/docspec-ex"
license=('EUPL-1.2')
provides=('docspec')
conflicts=('docspec')
options=('!strip')

source_x86_64=("docspec-${pkgver}-x86_64::https://github.com/docspec/docspec-ex/releases/download/${pkgver}/docspec_linux_x86_64")
source_aarch64=("docspec-${pkgver}-aarch64::https://github.com/docspec/docspec-ex/releases/download/${pkgver}/docspec_linux_aarch64")

sha256sums_x86_64=('1273a11173b99fdd016a3c70e7dcd3ab8a4bd194d116a18ce44e8a5d2ba07101')
sha256sums_aarch64=('e235e0b9a4df863b3fbe6ddc77bdea056c566040132e8d3ec9e8b4df4771a893')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/docspec-${pkgver}-x86_64" "${pkgdir}/usr/bin/docspec"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/docspec-${pkgver}-aarch64" "${pkgdir}/usr/bin/docspec"
    fi
}
