# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
# Contributer: Scimmia <scimmia22 at outlook dot com>
# Contributor: Orivej Desh <smpuj@bk.ru>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=reiser4progs
pkgver=1.0.8
pkgrel=3
pkgdesc="Reiser4 filesystem programs"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/reiser4/"
license=('GPL2')
depends=('e2fsprogs' 'libaal' 'readline')
options=('!libtool')
source=("http://sourceforge.net/projects/reiser4/files/reiser4-utils/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('61ed01da90faf50f960844e26d9bbab2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

