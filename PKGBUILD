pkgname=pandoc-crossref-bin
pkgver=0.3.4.1
_pandoc_pkgver=2_7_2
pkgrel=1
pkgdesc="Pandoc Cross References - executable only, without 750MB Haskell depends/makedepends"
url="https://hackage.haskell.org/package/pandoc-crossref"
license=("GPL2")
arch=('x86_64')
conflicts=("pandoc-crossref")
provides=("pandoc-crossref")
replaces=('pandoc-crossref-static' 'pandoc-crossref-lite')
depends=('pandoc')

source=(
    "pandoc-crossref-${pkgver}.tar.gz::https://github.com/lierdakil/pandoc-crossref/releases/download/v${pkgver}/linux-pandoc_${_pandoc_pkgver}.tar.gz"
)
sha256sums=('6424c97656b4f9bd888cc8778fd64731f254a570632e2609a157ef21d212d4fe')

package() {
    cd "${srcdir}"
    install -Dm755 pandoc-crossref "${pkgdir}/usr/bin/pandoc-crossref"
    install -Dm644 pandoc-crossref.1 "${pkgdir}/usr/share/man/man1/pandoc-crossref.1"
}
