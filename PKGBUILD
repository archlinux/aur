# Maintainer: Xyne <ac xunilhcra enyx, backwards>
_basename=siunitx
pkgname=texlive-"$_basename"
# Use "grep ProvidesExplPackage -r src/" to find the version.
pkgver=2.6e
pkgrel=1
pkgdesc="Typeset chemical formulae/equations and Risk and Safety phrases in LaTeX."
arch=('any')
depends=('texlive-bin')
conflicts=('texlive-science')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/"$_basename"/"
license=('LPPL')
source=(http://mirrors.ctan.org/install/macros/latex/contrib/"$_basename".tds.zip)
install="$pkgname".install

package() {
  mkdir -p -- "$pkgdir"/usr/share/texmf/
  cd -- "$pkgdir"/usr/share/texmf/
  bsdtar -xf "$srcdir/$_basename".tds.zip
  find "$pkgdir" -type f -exec chmod 644 {} \+
  find "$pkgdir" -type d -exec chmod 755 {} \+
}

sha1sums=('d5d0dbe320a316520ebc61197f16752eb32ebfe0')
