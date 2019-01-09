# Maintainer: Daniel Milde <daniel at milde dot cz>
pkgname=pecl-raphf
pkgver=2.0.0
pkgrel=3
pkgdesc="Resource and persistent handles factory"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/raphf"
license=('BSD')
depends=('php')
makedepends=('autoconf')
source=(http://pecl.php.net/get/raphf-${pkgver}.tgz)
md5sums=('bc465eb5caa9d0f09cced121a8ac2e8e')

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
  echo ";extension=raphf.so" > ${pkgdir}/etc/php/conf.d/2-raphf.ini
}
