# Maintainer: eNV25 <env252525@gmail.com>

# previous maintainer did not leave his email

pkgname=pandoc-crossref-bin
pkgver=0.3.15.0
_pkgver="$pkgver"
pkgrel=1
_pandoc_pkgver=2.19.2
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
sha256sums=('07951a4dd43ec221863b6ee8a3721c7354a07ecb1e6066fa405de522ec5987fd')

package() {
    cd "${srcdir}"
    install -Dm755 pandoc-crossref -t "${pkgdir}/usr/bin/"
    install -Dm644 pandoc-crossref.1 -t "${pkgdir}/usr/share/man/man1/"
}
