# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=kotlin-language-server
pkgname=${_pkgname}-bin
pkgver=1.3.13
pkgrel=1
pkgdesc="Kotlin code completion, diagnostics and more for any editor/IDE using the Language Server Protocol"
provides=("kotlin-language-server")
conflicts=("kotlin-language-server" "kotlin-language-server-git")
arch=('any')
url="https://github.com/fwcd/kotlin-language-server"
license=("MIT")

source=(
    "${_pkgname}-${pkgver}.zip::https://github.com/fwcd/kotlin-language-server/releases/download/${pkgver}/server.zip"
)

sha256sums=('4fe7d71d087b307c7869036171bd9d8c6a4284cd7c25b89098b0a24eb2d9b6d2')

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/lib"
    mv "${srcdir}/server" "${pkgdir}/usr/lib/kotlin-language-server"
    chmod 644 "${pkgdir}/usr/lib/kotlin-language-server/bin/"*.bat
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s ../lib/kotlin-language-server/bin/kotlin-language-server
}
