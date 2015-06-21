# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=mhchem
pkgname=texlive-mhchem-bundle
pkgver=4.01
pkgrel=1
pkgdesc="Typeset chemical formulae/equations and Risk and Safety phrases in LaTeX."
arch=('any')
depends=('texlive-bin')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/$_basename/"
provides=(texlive-"$_basename" texlive-rsphrase)
conflicts=(texlive-"$_basename" texlive-rsphrase)
license=('LPPL')
source=(http://mirror.ctan.org/macros/latex/contrib/"$_basename".zip)
install=$pkgname.install

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

sha256sums=('0d9b99f7c110e1ce71619dff90d64308917afbe2afa6adabe7006d309accb6c2')
