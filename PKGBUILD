pkgname=kotlin-lsp-bin
pkgver=0.252.17811
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('Apache')
conflicts=('kotlin-lsp-git')
provides=('kotlin-lsp')
depends=('java-runtime=17')
source=("${pkgname}-v${pkgver}.zip::https://download-cdn.jetbrains.com/kotlin-lsp/${pkgver}/kotlin-${pkgver}.zip")
sha256sums=('0f38b00afb6d81f63d252dc729a0bc33a009befd11adea99001a52797d67318c')

package() {
    echo ${pkgdir}
    chmod +x "${srcdir}/kotlin-lsp.sh"
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/kotlin-lsp.sh" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp"
    cp -r \
      "${srcdir}/lib" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/lib"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/kotlin-lsp.sh" \
      "${pkgdir}/usr/bin/kotlin-lsp"
}

