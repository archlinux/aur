pkgname=pandoc-citeproc-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Pandoc Cite Processor - executable only, without 750MB Haskell depends/makedepends"
url="https://hackage.haskell.org/package/pandoc-citeproc"
license=("custom:BSD3")
arch=('x86_64')
conflicts=("pandoc-citeproc")
provides=("pandoc-citeproc")
replaces=('pandoc-citeproc-static' 'pandoc-citeproc-lite')
depends=('pandoc')

source=(
    "https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux.tar.gz"
)
sha256sums=(
    "d8c37a2252afc1f53ce482c6e5cc77371f3f3f7e83f40d612fb8dc6fd30963ff"
)

package() {
    # the original pandoc executable is provided by a different package.
    rm "${srcdir}/pandoc-${pkgver}/bin/pandoc"
    rm "${srcdir}/pandoc-${pkgver}/share/man/man1/pandoc.1.gz"

	mkdir "${pkgdir}/usr"
	cp -r "${srcdir}/pandoc-${pkgver}/bin" "${pkgdir}/usr"
	cp -r "${srcdir}/pandoc-${pkgver}/share" "${pkgdir}/usr"
}
