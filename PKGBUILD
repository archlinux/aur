# Contributor: Daniel Milde <info@milde.cz>
pkgname=pecl-propro
pkgver=2.0.0
pkgrel=1
pkgdesc="Property proxy"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/propro"
license=('BSD')
depends=('php')
makedepends=('autoconf')
source=(http://pecl.php.net/get/propro-${pkgver}.tgz)
md5sums=('355d8fe8ca8a2ac47ecbc3a80e09af5f')

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
  echo ";extension=propro.so" > ${pkgdir}/etc/php/conf.d/propro.ini
}
