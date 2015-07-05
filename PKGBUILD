# Maintainer: Markus Härer <markus.haerer@gmx.net>
# Contributor: robotanarchy

pkgname=minted
pkgver=2.0
pkgrel=2
pkgdesc="Highlighted source code for LaTeX."
url="https://github.com/gpoore/${pkgname}"
arch=('any')
license=('LPPL')
depends=('texlive-latexextra' 'pygmentize')
source=("https://github.com/gpoore/minted/archive/v${pkgver}.tar.gz"
        "minted.install")
install=minted.install
md5sums=('1716f44432f79eab08f9e465e8ddbb83'
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
