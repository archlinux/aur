# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=dnd-5e-latex-template
_pkgname=DND-5e-LaTeX-Template
pkgver=0.8.0
pkgrel=1
pkgdesc="LaTeX template to typeset material for Dungeons and Dragons 5e"
arch=('any')
url="https://github.com/rpgtex/DND-5e-LaTeX-Template"
license=('MIT')
depends=('texlive-core' 'texlive-latexextra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpgtex/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af3f89a5876b79a43c605fd48b2fd81e139323ab49f2543bf5a205d70ca7224b')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "${pkgdir}/usr/share/texmf-dist/tex/latex/$pkgname"
  cp -r dnd.sty  dndbook.cls  dndcore.def  dndoptions.clo img lib \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/$pkgname"

  cd "${pkgdir}/usr/share/texmf-dist/tex/latex/$pkgname"
  find . -type d -exec chmod 755 {} \;
  find . -type f -exec chmod 644 {} \;
}
