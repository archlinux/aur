# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=3.38
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
b2sums=('4b340e37997bc788afd29f5197b4eb2d2a35d6e828c6a0fa674db6ecc5c674ce365478add27251bd7a885817cb2fc4a0b3c036ab9edbba38f881148978ede896')

build() {
  cd ${_pkgname}-${pkgver}
  # currently broken
  # l3build doc
}

package() {
  cd ${_pkgname}-${pkgver}
  l3build install --texmfhome ${pkgdir}/usr/share/texmf
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
