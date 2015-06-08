# Maintainer: jsteel <mail at jsteel dot org>

pkgname=php-ssh
pkgver=0.12
pkgrel=1
pkgdesc="An SSH2 extension for PHP"
url="http://pecl.php.net/package/ssh2"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php' 'openssh')
makedepends=('php')
install=$pkgname.install
source=(http://pecl.php.net/get/ssh2-$pkgver.tgz)
md5sums=('409b91678a842bb0ff56f2cf018b9160')

build() {
  cd "$srcdir"/ssh2-$pkgver

  phpize

  ./configure --prefix=/usr --with-ssh2

  make
}

package() {
  cd "$srcdir"/ssh2-$pkgver

  make install INSTALL_ROOT="$pkgdir"/
}
