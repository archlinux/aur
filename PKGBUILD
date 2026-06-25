pkgname=kotlin-lsp-bin
pkgver=262.8190.0
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('Apache')
conflicts=('kotlin-lsp-git')
provides=('kotlin-lsp')
depends=('java-runtime>=17')
source=("https://download-cdn.jetbrains.com/language-server/kotlin-server/${pkgver}/kotlin-server-${pkgver}.tar.gz")
sha256sums=('8b4c70e95065420e7867c99aaf9f18e0b4e76311ec453e4c1a39e3f6ae774cbf')

package() {
    source_dir=$srcdir/kotlin-server-${pkgver}
    chmod +x "${source_dir}/kotlin-lsp.sh"
    chmod +x ${source_dir}/jbr/bin/*
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp" \
      "${pkgdir}/usr/bin"
    cp -r \
      ${source_dir}/* \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/bin/intellij-server" \
      "${pkgdir}/usr/bin/kotlin-lsp"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-lsp/bin/intellij-server" \
      "${pkgdir}/usr/bin/intellij-server"
}

