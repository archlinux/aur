# Maintainer: Hauke Fath <h.fath at nt dot tu-darmstadt dot de>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=4.06
pkgrel=2
pkgdesc='TUDa-CI for LaTeX from Technical University of Darmstadt'
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
  'texlive-langenglish'
  'texlive-latexextra'
  'texlive-luatex'
  'texlive-pictures'
  'texlive-publishers'
  'zip'
)
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('55193883f86d558ce2be196f0464959cdd6b3246f32361826defef127e8d01f5182dfae8072732d1372e3c870763e8781b80a28a608aad14e377089742e6b893')

build() {
  cd ${_pkgname}-${pkgver}
  l3build doc
}

package() {
  cd ${_pkgname}-${pkgver}
  l3build install --full --texmfhome ${pkgdir}/usr/share/texmf
}
