pkgname=kotlin-lsp-bin
pkgver=262.2310.0
pkgrel=2
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('Apache')
conflicts=('kotlin-lsp-git')
provides=('kotlin-lsp')
depends=('java-runtime=17')
source=("https://download-cdn.jetbrains.com/kotlin-lsp/${pkgver}/kotlin-lsp-${pkgver}-linux-x64.zip")
sha256sums=('c004242158f4b5e1d917ddd848e6f6a279484fa58a3e2bce8846b807d1ad16b1')

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

