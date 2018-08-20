# Maintainer: 2ion <dev@2ion.de>
pkgname=qolibri
pkgver=2.0.2
pkgrel=1
pkgdesc="A QT-based EPWING dictionary viewer"
url="http://qolibri.sourceforge.jp/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-webkit' 'zlib' 'eb-library')
source=("https://github.com/ludios/qolibri/archive/${pkgver}.tar.gz")
md5sums=('91f2f8eb542c19074e9ac10af09fbfb8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make -j4
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}
