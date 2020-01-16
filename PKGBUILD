# Maintainer: Adrian Sausenthaler <aur@sausenthaler.de>

pkgname=php74-mcrypt
pkgver=1.0.2
pkgrel=1
pkgdesc="mcrypt module for extra/php package (7.2.0-7.4.0)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mcrypt"
license=('PHP')
depends=('php' 'libmcrypt')
makedepends=('autoconf' 're2c')
source=(http://pecl.php.net/get/mcrypt-${pkgver}.tgz)
install=mcrypt.install

build() {
  cd ${srcdir}/mcrypt-${pkgver}
  phpize
  ./configure
  make
}

package() {
  cd ${srcdir}/mcrypt-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -d ${pkgdir}/etc/php/conf.d
  echo "extension=mcrypt.so" > ${pkgdir}/etc/php/conf.d/mcrypt.ini
}

md5sums=('72ff2090a523dc6c388e5ee75d23b035')
