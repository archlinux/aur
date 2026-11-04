pkgname=kotlin-lsp-bin
pkgver=263.7084.0
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('Apache')
conflicts=('kotlin-lsp-git')
provides=('kotlin-lsp')
depends=('java-runtime>=17')
source=("https://download.jetbrains.com/language-server/kotlin-server/${pkgver}/kotlin-server-${pkgver}.tar.gz")
sha256sums=('ae0c4b01e17ab73a4a5227a78ea99e6dcbe3e499600315b22759a4e4cddd11df')

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

