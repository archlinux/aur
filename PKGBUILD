pkgname=adt-cli
pkgver=1.0.8
pkgrel=1
pkgdesc="kotlin lsp workspace file generator"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('LGPL-3.0')
depends=('java-runtime=21')
source=("https://github.com/yamsergey/yamsergey.adt/releases/download/${pkgver}/adt-cli-${pkgver}.tar.gz")
sha256sums=('803cdcb43073b77d3e8123719ad0ccea8af9aefa0cf0f07754c20bb873a04fec')

package() {
    cd ${pkgname}
    chmod +x "${srcdir}/${pkgname}/bin/adt-cli"
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/share/kotlin/adt-cli" \
      "${pkgdir}/usr/share/kotlin/adt-cli/bin" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${pkgname}/bin/adt-cli" \
      "${pkgdir}/usr/share/kotlin/adt-cli/bin"
    cp -r \
      "${srcdir}/${pkgname}/lib" \
      "${pkgdir}/usr/share/kotlin/adt-cli/lib"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/adt-cli/bin/adt-cli" \
      "${pkgdir}/usr/bin/adt-cli"
}

