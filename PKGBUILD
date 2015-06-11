# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: tze <tze@datalove.me>

pkgname=texlive-flashcards
pkgver=1.0.1
pkgrel=2
license=('GPL')
depends=('texlive-core')
pkgdesc="A class for typesetting flashcards."
url="http://ctan.org/pkg/flashcards"
arch=('any')
install=texlive-flashcards.install
source=(http://mirror.ctan.org/macros/latex/contrib/flashcards.zip)
md5sums=('21f85c9b291a0d06e815ce09d89f4463')

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

