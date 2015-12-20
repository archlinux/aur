# Maintainer: Markus Härer <markus.haerer@gmx.net>
# Contributor: robotanarchy

pkgname=minted
pkgver=2.1
pkgrel=1
pkgdesc="Highlighted source code for LaTeX."
url="https://github.com/gpoore/${pkgname}"
arch=('any')
license=('LPPL')
depends=('texlive-latexextra' 'pygmentize')
source=("https://github.com/gpoore/minted/archive/v${pkgver}.tar.gz"
        "minted.install")
install=minted.install
md5sums=('a578a2e19f6a7254aa1f1c4e233a93a8'
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
