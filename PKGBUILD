# Maintainer: Xyne <ac xunilhcra enyx, backwards>
_basename=siunitx
pkgname=texlive-"$_basename"
# Use "grep ProvidesExplPackage -r src/" to find the version.
pkgver=2.6p
pkgrel=1
pkgdesc="Typeset chemical formulae/equations and Risk and Safety phrases in LaTeX."
arch=('any')
depends=('texlive-bin')
conflicts=('texlive-science')
# url="http://www.ctan.org/tex-archive/macros/latex/contrib/"$_basename"/"
# source=("http://mirrors.ctan.org/install/macros/latex/contrib/${_basename}.tds.zip")
url="https://github.com/josephwright/$_basename"
source=("${url}/archive/stable.zip")
license=('LPPL')
install="$pkgname".install

package() {
  cd -- "${srcdir}/${_basename}-stable"
  tex "${_basename}.dtx"
  _dstdir="${pkgdir}/usr/share/texmf/tex/latex/${_basename}"
  install -dm755 -- "$_dstdir"
  install -m644 -t "$_dstdir" *.cfg *.sty
}

sha1sums=('bed5b28e4624bbf35173be50f0a584a53785a9fb')
