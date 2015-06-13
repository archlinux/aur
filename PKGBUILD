# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>
# Based on pandoc-static

_pkgname=scholdoc
pkgname=${_pkgname}-static-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Conversion between markup formats including ScholarlyMarkdown (no Haskell libraries)'
url='http://scholarlymarkdown.com/'
license=('GPL')

replaces=("$_pkgname")
provides=("$_pkgname")

arch=('x86_64')
depends=('gmp' 'zlib')
# 'texlive-most: for PDF creation'
optdepends=(
  "texlive-science: for PDF creation (avoid LaTeX Error: File \`algorithm.sty' not found)"
)
options=(strip)
source=("http://scholarlymarkdown.com/scholdoc-distribution/linux/${_pkgname}-${pkgver}-ubuntu14.tgz")
md5sums=('ab73a83b5bfe2102ebf3ce59aea765ac')

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mv "$srcdir/${_pkgname}"          "$pkgdir/usr/bin/"
  mv "$srcdir/${_pkgname}-citeproc" "$pkgdir/usr/bin/"

  # FIXME add some manuals
  #install -Dm644 {,"$pkgdir"/usr/share/}man/man1/${_pkgname}.1
  #install -Dm644 {,"$pkgdir"/usr/share/}man/man5/${_pkgname}_markdown.5
}
