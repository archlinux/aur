# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=Caneda
pkgname=caneda
pkgver=0.3.1
pkgrel=1
pkgdesc="Open source EDA software suite focused on ease of use and portability"
arch=('any')
url="http://caneda.org"
license=('LGPL')
depends=('qt5-base' 'cmake' 'qwt')
makedepends=('git')
source=("https://github.com/Caneda/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('69afb5bba8a70d1fdf00fa6407b25351')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
