# Maintainer: Markus Härer <markus.haerer@gmx.net>
# Contributor: robotanarchy
# Contributor: Philipp Trommler <aur@philipp-trommler.me>

pkgname=minted
pkgver=2.4
pkgrel=1
pkgdesc="Highlighted source code for LaTeX."
url="https://github.com/gpoore/${pkgname}"
arch=('any')
license=('LPPL')
depends=('texlive-latexextra' 'pygmentize' 'fvextra')
source=("https://github.com/gpoore/minted/archive/v${pkgver}.tar.gz"
        "minted.install")
install=minted.install
md5sums=('8e1ff1f526d8fb15ab7c6aabcdd4a3a4'
         'a573ca786bc416e905171f49abf3ba46')

build() {
  cd "${srcdir}/minted-${pkgver}/source"
  tex minted.ins
}

package() {
  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/minted-${pkgver}/source/minted.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}"
  install -Dm644 "${srcdir}/minted-${pkgver}/source/minted.pdf" "${pkgdir}/usr/share/doc/${pkgname}"
}
