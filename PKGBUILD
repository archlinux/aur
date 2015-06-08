# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
pkgname='java-freehep-vectorgraphics'
_pkgname='vectorgraphics'
pkgver='2.1.1'
pkgrel=2
pkgdesc='A Image and Vector Graphics package which enables Java programs to generate image and vector graphics in a variety of formats'
depends=('java-runtime')
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://java.freehep.org/vectorgraphics/'
source=(ftp://ftp.slac.stanford.edu/software/freehep/VectorGraphics/v${pkgver}/${_pkgname}-${pkgver}-bin.tar.gz)
sha256sums=('f507586f3834258564e43759c1ef72c7abf1648e89f07ef4b2e4cbdcb6fed587')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm644 "LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  cd lib
  for file in `find . -maxdepth 1 -regex ".*\.jar" | xargs`; do
    install -Dm644 "${file}" \
      "${pkgdir}/usr/share/java/${_pkgname}/${file}"
  done
}
