# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=latex-mathabx
_pkgname=mathabx
pkgver=2005.05.18
pkgrel=1
pkgdesc="Mathematical symbols not included in the standard distribution"
arch=('any')
url="http://www.ctan.org/tex-archive/fonts/mathabx"
license=('unknown')
depends=('texlive-core')
source=("http://mirror.ctan.org/fonts/mathabx.zip")
install="$pkgname.install"
md5sums=('82eecbe10d9f5593e01d257523a03c42')

package() {
  TEXMF="/usr/share/texmf"

  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/$TEXMF/fonts/source/public/mathabx" 
  cp source/*.mf "$pkgdir/$TEXMF/fonts/source/public/mathabx/"

  mkdir -p "$pkgdir/$TEXMF/tex/generic/misc"
  cp texinputs/* "$pkgdir/$TEXMF/tex/generic/misc/"

  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
}
