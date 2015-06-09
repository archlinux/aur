# Maintainer: Tim Cooper <tim.cooper@layeh.com>

pkgname='qsolocards'
pkgver='0.99.1'
pkgrel='4'
pkgdesc='A free collection of solitaire card games written using Qt'
arch=('i686' 'x86_64')

url='http://sourceforge.net/projects/qsolocards/'
license=('GPL3')

depends=('qt4')

source=(http://downloads.sourceforge.net/project/qsolocards/qsolocards/${pkgver}/QSoloCards-${pkgver}-src.tar.gz
        qsolocards.desktop)

md5sums=(3a6a1d2f488b68986b822b3fd6961140
         5ac16b0777aff74df0720c4c491f96e6)

build() {
  cd ${srcdir}/QSoloCards-${pkgver}
  qmake-qt4
  make
}

package() {
  cd ${srcdir}/QSoloCards-${pkgver}
  install -Dm 0644 images/sol128x128.png ${pkgdir}/usr/share/qsolocards/sol128x128.png
  install -Dm 0644 ../qsolocards.desktop ${pkgdir}/usr/share/applications/qsolocards.desktop
  install -D QSoloCards ${pkgdir}/usr/bin/qsolocards
}
