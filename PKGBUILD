# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=4.01
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
b2sums=('96dff00120d1a36067d04559e1bc45517f0d9172a59b8659cb0414e34d1f3f56b5c320449b1c7faf082e77fa922126af815df10941fa73707bf9135084cecd39')

build() {
  cd ${_pkgname}-${pkgver}
  l3build doc
}

package() {
  cd ${_pkgname}-${pkgver}
  l3build install --full --texmfhome ${pkgdir}/usr/share/texmf
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
