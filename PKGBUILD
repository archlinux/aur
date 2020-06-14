# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: xu yuan, mohammed alfaki, lukas drude

pkgname=texlive-pgf-pie
pkgver=0.3
pkgrel=1
pkgdesc="Some LaTeX macros for pie chart by using PGF/Tikz package."
arch=('any')
url="https://github.com/xuyuan/pgf-pie/"
license=('GPL2' 'custom:LPPLv1.3c')
depends=('texlive-core')
install=${pkgname}.install
source=("https://github.com/pgf-tikz/pgf-pie/releases/download/${pkgver}/pgf-pie.zip")
sha256sums=('a80a9a499c666164c7bfa4bf5751f5eae1378691f7246f952f803e43ddce1174')

package() {
  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/${pkgname#texlive-}"
  install -D -m644 "${srcdir}/pgf-pie.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname#texlive-}/pgf-pie.sty"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 "${srcdir}/LICENSE-GPL2.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL2.txt"
  install -D -m644 "${srcdir}/LICENSE-LPPL1.3c.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-LPPL1.3c.txt"
}
