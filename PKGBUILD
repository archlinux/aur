# Maintainer: Alex Oleshkevich <techsupport@investerra.ch>
pkgbase=babel-lsp
pkgname=babel-lsp
pkgver=0.3.0
pkgrel=1
pkgdesc="Language server for Python Babel i18n (.po/.pot catalog diagnostics, completion, hover)"
arch=('x86_64' 'aarch64')
url="https://github.com/alex-oleshkevich/babel-lsp"
license=('MIT')
depends=()
provides=('babel-lsp')
conflicts=('babel-lsp')

source_x86_64=("${pkgname}-linux-x86_64::${url}/releases/download/v${pkgver}/babel-lsp-linux-x86_64")
source_aarch64=("${pkgname}-linux-aarch64::${url}/releases/download/v${pkgver}/babel-lsp-linux-aarch64")
sha256sums_x86_64=('8c2d8c31a4e31f96ae23a4128880d20301c6e17317406d9be8919d2e89dbd974')
sha256sums_aarch64=('fb8483ea87cc8091f782c453c1330108178feaec867f24702d5138c8c6433d00')

package() {
    case "$CARCH" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-linux-x86_64"  "${pkgdir}/usr/bin/babel-lsp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-linux-aarch64" "${pkgdir}/usr/bin/babel-lsp" ;;
    esac
}
