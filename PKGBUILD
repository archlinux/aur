pkgname=php-dio
pkgver=0.0.7
pkgrel=2
pkgdesc="POSIX direct I/O functions for PHP"
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/dio"
license=('PHP')
depends=('php' 'php-pear')
makedepends=('autoconf')
source=(http://pecl.php.net/get/dio-${pkgver}.tgz)
md5sums=('a1a4df428a17dbe1ab4277b492dfa052')

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

