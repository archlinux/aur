# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=4.04
pkgrel=1
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
makedepends=(
  'biber'
  'texlive-basic'
  'texlive-bibtexextra'
  'texlive-bin'
  'texlive-fontsextra'
  'texlive-langcyrillic'
  'texlive-langgerman'
  'texlive-latexextra'
  'texlive-luatex'
  'texlive-pictures'
  'texlive-publishers'
  'zip'
)
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/${_pkgname}/archive/v${pkgver}/${pkgver}-${_pkgname}.tar.gz")
b2sums=('01a60e2b5b849807b48fd3783c920ed77c600125fe82292c6ef68178b27e37d57a279997c1e3e531e7fb821176a8e785654b777bd01934ea64fcf6d8a8406d48')

build() {
  cd ${_pkgname}-${pkgver}
  l3build doc
}

package() {
  cd ${_pkgname}-${pkgver}
  l3build install --full --texmfhome ${pkgdir}/usr/share/texmf
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
