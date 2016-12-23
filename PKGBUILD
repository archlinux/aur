# Maintainer: Xyne <ac xunilhcra enyx, backwards>
_basename=siunitx
pkgname=texlive-"$_basename"
# Use "grep ProvidesExplPackage -r src/" to find the version.
pkgver=2.6q
pkgrel=2
pkgdesc="Typeset physical quantities in LaTeX."
arch=('any')
depends=('texlive-bin')
conflicts=('texlive-science')
# url="http://www.ctan.org/tex-archive/macros/latex/contrib/"$_basename"/"
# source=("http://mirrors.ctan.org/install/macros/latex/contrib/${_basename}.tds.zip")
url="https://github.com/josephwright/$_basename/"
source=("https://github.com/josephwright/$_basename/archive/v$pkgver.zip")
license=('LPPL')
install="$pkgname".install

package() {
  cd -- "${srcdir}/${_basename}-${pkgver}"
  tex "${_basename}.dtx"
  _dstdir="${pkgdir}/usr/share/texmf/tex/latex/${_basename}"
  install -dm755 -- "$_dstdir"
  install -m644 -t "$_dstdir" *.cfg *.sty
}

sha1sums=('e5a9f70b9e139b57205d070952e5a033a808aac5')