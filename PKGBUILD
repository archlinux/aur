# Maintainer: Alex Oleshkevich <techsupport@investerra.ch>
pkgbase=babel-lsp
pkgname=babel-lsp
pkgver=0.2.1
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
sha256sums_x86_64=('cdb14cfa01e781c833dfda33edfbdee97853e4a60482b2d8d6fb798216b22f23')
sha256sums_aarch64=('dffb1cb1ecaace7638790a5018155bb067bb5f92c874ab35ecf601e765a76988')

package() {
    case "$CARCH" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-linux-x86_64"  "${pkgdir}/usr/bin/babel-lsp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-linux-aarch64" "${pkgdir}/usr/bin/babel-lsp" ;;
    esac
}
