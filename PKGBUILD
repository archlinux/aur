# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=libgaminggear
pkgver=0.1.0
pkgrel=2
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=()
makedepends=('cmake' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
md5sums=('8c930b177be18e94e99fba125399b130')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install

  mv ${pkgdir}/usr/share/cmake{,-2.8}
}
