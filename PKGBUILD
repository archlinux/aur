# Maintainer: Alex Oleshkevich <alex.oleshkevich@gmail.com>
pkgname=sqlalchemy-lsp
pkgver=0.2.1
pkgrel=1
pkgdesc="Language server for SQLAlchemy and Alembic: diagnostics, completion, hover, navigation"
arch=('x86_64' 'aarch64')
url="https://github.com/alex-oleshkevich/sqlalchemy-lsp"
license=('MIT')
provides=('sqlalchemy-lsp')
conflicts=('sqlalchemy-lsp')

source_x86_64=("${pkgname}-linux-x86_64::${url}/releases/download/v${pkgver}/sqlalchemy-lsp-linux-x86_64")
source_aarch64=("${pkgname}-linux-aarch64::${url}/releases/download/v${pkgver}/sqlalchemy-lsp-linux-aarch64")
sha256sums_x86_64=('42823851115ba292e2251f19bb2d1229f4e0a539d6d6c991b08a6c6f769c8037')
sha256sums_aarch64=('831d56a2c6ae25ab70407b35fa96f97c557d8e540cc3b4575435d63c951e617c')

package() {
    case "$CARCH" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-linux-x86_64"  "${pkgdir}/usr/bin/sqlalchemy-lsp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-linux-aarch64" "${pkgdir}/usr/bin/sqlalchemy-lsp" ;;
    esac
}
