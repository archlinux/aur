pkgname=adt-cli
pkgver=1.0.8
pkgrel=2
pkgdesc="kotlin lsp workspace file generator"
arch=(any)
url="https://github.com/Kotlin/kotlin-lsp"
license=('LGPL-3.0')
depends=('java-runtime=26')
source=(
	"https://github.com/yamsergey/yamsergey.adt/releases/download/${pkgver}/adt-cli-${pkgver}.tar.gz"
	"adt-cli"
)
sha256sums=(
	'803cdcb43073b77d3e8123719ad0ccea8af9aefa0cf0f07754c20bb873a04fec'
	'35070869fc7f99a5b1a5699b015caa56727b049ea7caaf461731685bed7c9761'
)

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
    cp \
      "../../adt-cli" \
      "${pkgdir}/usr/bin/adt-cli"
}

