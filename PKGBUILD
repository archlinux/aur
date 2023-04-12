# Maintainer: eNV25 <env252525@gmail.com>

# previous maintainer did not leave his email

pkgname=pandoc-crossref-bin
pkgver=v0.3.15.2.a
_pkgver=0.3.15.2a
pkgrel=1
_pandoc_pkgver=3.1.2
pkgdesc="Pandoc filter for cross-references - executable only"
url="https://github.com/lierdakil/pandoc-crossref/"
license=("GPL2")
arch=('x86_64')
conflicts=("pandoc-crossref")
provides=("pandoc-crossref")
replaces=("haskell-pandoc-crossref-bin" 'pandoc-crossref-static' 'pandoc-crossref-lite')
depends=("pandoc>=${_pandoc_pkgver}")
options=(!strip)

source=(
    "pandoc-crossref-${_pkgver}.tar.xz::https://github.com/lierdakil/pandoc-crossref/releases/download/v${_pkgver}/pandoc-crossref-Linux.tar.xz"
)
sha256sums=('3ee144103f98d719bf780face01d7074c7bfde3ae5923652723f017daafc4906')

package() {
    cd "${srcdir}"
    install -Dm755 pandoc-crossref -t "${pkgdir}/usr/bin/"
    install -Dm644 pandoc-crossref.1 -t "${pkgdir}/usr/share/man/man1/"
}
