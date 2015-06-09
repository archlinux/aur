# Contributor: Daniel Milde <info@milde.cz>
pkgname=pecl-raphf
pkgver=1.0.4
pkgrel=1
pkgdesc="Resource and persistent handles factory"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/raphf"
license=('BSD')
depends=('php')
makedepends=('autoconf')
source=(http://pecl.php.net/get/raphf-${pkgver}.tgz)
md5sums=('e5e7e5c3954a5fd31c034c347f22c4a5')

build() {
  cd ${srcdir}/raphf-${pkgver}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/raphf-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo ";extension=raphf.so" > ${pkgdir}/etc/php/conf.d/raphf.ini
}
