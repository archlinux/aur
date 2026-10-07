pkgname=kotlin-lsp-bin
pkgver=263.6379.0
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('Apache')
conflicts=('kotlin-lsp-git')
provides=('kotlin-lsp')
depends=('java-runtime>=17')
source=("https://download.jetbrains.com/language-server/kotlin-server/${pkgver}/kotlin-server-${pkgver}.tar.gz")
sha256sums=('ab8ca4455dc2fc5fe1a24db2bccc46c104254d2c465155c4251ee65df8f3f7cc')

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

