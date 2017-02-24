pkgname=php-dio
pkgver=0.0.9
pkgrel=1
pkgdesc="POSIX direct I/O functions for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/dio"
license=('PHP')
depends=('php' 'php-pear')
makedepends=('autoconf')
source=(http://pecl.php.net/get/dio-${pkgver}.tgz)
sha512sums=('7bca34a50a1c6cc1f28f47e62392d5a71bccf2783e12f510cc0101949c68d753650e19dbf9ef8172ba23c02680d30959791738353d89762f806ac7ae72a20058')

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

