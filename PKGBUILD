# Maintainer: Philipp Trommler <aur@philipp-trommler.me>

pkgname=fvextra
pkgver=1.2
pkgrel=1
pkgdesc="Extensions to fancyvrb, including automatic line breaking and improved math mode."
url="https://github.com/gpoore/${pkgname}"
arch=('any')
license=('LPPL')
depends=('texlive-latexextra')
source=("https://github.com/gpoore/fvextra/archive/v${pkgver}.tar.gz"
        "fvextra.install")
install=fvextra.install
md5sums=('4571bc44c284f23eb40801a8d398033e'
         'a573ca786bc416e905171f49abf3ba46')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/fvextra"
  tex fvextra.ins
}

package() {
  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fvextra/fvextra.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/fvextra/fvextra.pdf" "${pkgdir}/usr/share/doc/${pkgname}"
}
