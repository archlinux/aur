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
sha256sums_x86_64=('c0c0aadba90bc72c8bce9de695b0383e2263a2ea7fd04a1fab93d69cc024b473')
sha256sums_aarch64=('a9bbf14c85a81676b52b03449690d89d4285cb978940b9d7556c5c1c207a5ff5')

package() {
    case "$CARCH" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-linux-x86_64"  "${pkgdir}/usr/bin/sqlalchemy-lsp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-linux-aarch64" "${pkgdir}/usr/bin/sqlalchemy-lsp" ;;
    esac
}
