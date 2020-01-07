# Maintainer: Daniel Milde <daniel at milde dot cz>
pkgname=pecl-propro
pkgver=2.1.0
pkgrel=2
pkgdesc="Property proxy"
arch=('x86_64')
url="http://pecl.php.net/package/propro"
license=('BSD')
depends=('php')
makedepends=('autoconf')
source=(http://pecl.php.net/get/propro-${pkgver}.tgz)
md5sums=('cb53d926b3bbd4e98b08757dd4b40fc9')

build() {
  cd ${srcdir}/propro-${pkgver}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/propro-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo ";extension=propro.so" > ${pkgdir}/etc/php/conf.d/1-propro.ini
}
