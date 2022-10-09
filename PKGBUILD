# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=mhchem
pkgname=texlive-mhchem-bundle
pkgver=4.09
pkgrel=1
pkgdesc="Typeset chemical formulae/equations and Risk and Safety phrases in LaTeX."
arch=('any')
depends=('texlive-bin')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/$_basename/"
provides=(texlive-"$_basename" texlive-rsphrase)
conflicts=(texlive-"$_basename" texlive-rsphrase)
license=('LPPL')
source=(http://mirror.ctan.org/macros/latex/contrib/"$_basename".zip)

package() {
  cd -- "$srcdir/$_basename"
  for sty in *.sty
  do
    install -Dm644 "$sty" "$pkgdir/usr/share/texmf/tex/latex/$_basename/$sty"
  done

  for doc in "$_basename".{pdf,tex}
  do
    install -Dm644 "$doc" "$pkgdir/usr/share/texmf/tex/latex/$_basename/doc/$doc"
  done
}

sha256sums=('a6091d48f59beabd27b5ac3b1d9d7865532a0a75f4c0da3d4a4c325a45be48ca')
