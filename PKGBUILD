# Maintainer: adlerweb <aur at adlerweb dot info>#Maintainer: 

pkgname=php-dio
pkgver=0.1.0
pkgrel=1
pkgdesc="POSIX direct I/O functions for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/dio"
license=('PHP')
depends=('php' 'php-pear')
makedepends=('autoconf')
source=(http://pecl.php.net/get/dio-${pkgver}.tgz)
sha512sums=('6fca1c3f2d6247f5e0c52a27b49d80a6d13f9630772956ff7aa73ad45e445686502edd956346c43955cb2f858c0c0259af86c3f92b6f93309a2b90583ad8ea05')

build() {
  cd $startdir/src/dio-${pkgver}
  phpize || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $startdir/src/dio-${pkgver}
  make INSTALL_ROOT=${startdir}/pkg/${pkgname} install || return 1
}

