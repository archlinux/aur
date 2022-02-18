# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: tze <tze@datalove.me>

pkgname=texlive-flashcards
pkgver=1.0.1
pkgrel=2
license=('GPL')
depends=('texlive-core')
pkgdesc="A class for typesetting flashcards."
url="https://ctan.org/pkg/flashcards"
arch=('any')
install=texlive-flashcards.install
source=(https://mirror.ctan.org/macros/latex/contrib/flashcards.zip)
sha256sums=('3a344b39e4d3f36152772458c85b32f294e18b13617ac79b18b49406ce73fc52')

build ()
{
  cd "${srcdir}/flashcards"
  latex flashcards.ins
}

package ()
{
  cd "${srcdir}/flashcards"
  mkdir -p -- "${pkgdir}/usr/share/texmf/tex/latex/flashcards"

  cp -- flashcards.cls "${pkgdir}/usr/share/texmf/tex/latex/flashcards"
  cp -- *.cfg "${pkgdir}/usr/share/texmf/tex/latex/flashcards"

  install -D -- "${srcdir}/flashcards/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

