# Maintainer: Simon Doppler (dopsi) <dop.simon_at_gmail.com>

# Former maintaining team :
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.4
pkgrel=3
pkgdesc="An electric diagram editor"
arch=('i686' 'x86_64')
url="http://qelectrotech.tuxfamily.org/"
install='qelectrotech.install'
license=('GPL2')
depends=('qt4' 'shared-mime-info')
md5sums=('3699e5718e0adc361511513c9f1f7ea1')
source=(http://download.tuxfamily.org/qet/tags/20150220/${pkgname}-${pkgver}-src.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  sed -i s,usr\/local,usr,g qelectrotech.pro
  qmake-qt4
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  make INSTALL_ROOT=${pkgdir} install
}
