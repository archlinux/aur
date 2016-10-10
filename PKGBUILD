# Maintainer: Will Price <will.price94@gmail.com>

pkgname=vosviewer
pkgver=1.6.5
pkgrel=1
pkgdesc="Visualising scientific landscapes"
arch=('i686' 'x86_64')
url="www.vosviewer.com"
license=('CUSTOM')
makedepends=()
depends=('java-runtime')
source=("vosviewer"
        "vosviewer_$pkgver.zip::http://www.vosviewer.com/download/f-y2u2.zip")
md5sums=('cb1a1d11e96e2f628db95a38eae8a9eb'
         '7002f730908ec4a59b2547d805b951d4')

package() {
  mkdir -p "${pkgdir}/usr/"{bin,share/{"${pkgname}",doc/"${pkgname}"}}

  for file in VOSviewer.jar LICENSE.txt; do
    cp -a "${srcdir}/${file}" \
          "${pkgdir}/usr/share/${pkgname}"
  done
  cp -a "${srcdir}/Manual_VOSviewer_${pkgver}.pdf" \
        "${pkgdir}/usr/share/doc/${pkgname}/manual_vosviewer.pdf"
  install -m755 vosviewer "${pkgdir}/usr/bin/vosviewer"
}

# vim:set ts=2 sw=2 et:
