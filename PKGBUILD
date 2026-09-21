# Maintainer: Alex Oleshkevich <alex.oleshkevich@gmail.com>
pkgname=sqlalchemy-lsp
pkgver=0.2.2
pkgrel=1
pkgdesc="Language server for SQLAlchemy and Alembic: diagnostics, completion, hover, navigation"
arch=('x86_64' 'aarch64')
url="https://github.com/alex-oleshkevich/sqlalchemy-lsp"
license=('MIT')
provides=('sqlalchemy-lsp')
conflicts=('sqlalchemy-lsp')

source_x86_64=("${pkgname}-linux-x86_64::${url}/releases/download/v${pkgver}/sqlalchemy-lsp-linux-x86_64")
source_aarch64=("${pkgname}-linux-aarch64::${url}/releases/download/v${pkgver}/sqlalchemy-lsp-linux-aarch64")
sha256sums_x86_64=('fd3890ff23b6ea9d0ee7d37e7b87f4700ee2b7aa2fa12ed588665614ed8916c5')
sha256sums_aarch64=('25cf4bf43c986538892b0deec349e5e163330026aa7f066a3e91d6f4d2765d6e')

package() {
    case "$CARCH" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-linux-x86_64"  "${pkgdir}/usr/bin/sqlalchemy-lsp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-linux-aarch64" "${pkgdir}/usr/bin/sqlalchemy-lsp" ;;
    esac
}
