pkgname=kotlin-lsp-bin
pkgver=261.13587.0
pkgrel=2
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('Apache')
conflicts=('kotlin-lsp-git')
provides=('kotlin-lsp')
depends=('java-runtime=17')
source=("${pkgname}-v${pkgver}.zip::https://download-cdn.jetbrains.com/kotlin-lsp/261.13587.0/kotlin-lsp-${pkgver}-linux-x64.zip")
sha256sums=('dc0ed2e70cb0d61fdabb26aefce8299b7a75c0dcfffb9413715e92caec6e83ec')

package() {
    echo ${pkgdir}
    chmod +x "${srcdir}/kotlin-lsp.sh"
    chmod +x ${srcdir}/jre/bin/*
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/kotlin-lsp.sh" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp"
    cp -r \
      "${srcdir}/jre" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/jre"
    cp -r \
      "${srcdir}/lib" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/lib"
    cp -r \
      "${srcdir}/native" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/native"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/kotlin-lsp.sh" \
      "${pkgdir}/usr/bin/kotlin-lsp"
}

