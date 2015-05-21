pkgname=huawei-stat-e220
pkgver=0.1
pkgrel=3
pkgdesc="HUAWEI E220 statistics interface"
arch=('i686' 'x86_64')
url="http://oozie.fm.interia.pl/pro/huawei-e220/"
license=(GPL)
depends=('libusb')
source=(http://oozie.fm.interia.pl/src/he220stat.tar.bz2)
md5sums=('aa800f85183dc1990102846773fbefd9')

build() {
  cd ${srcdir}/he220stat*
  ./configure --prefix=/usr
  sed -i -e "s|/usr/local/bin|${pkgdir}/usr/bin|g" Makefile
  make
}

package() {
  cd ${srcdir}/he220stat*
  mkdir -p "$pkgdir/usr/bin"

  make install
}
