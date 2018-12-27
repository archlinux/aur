# Maintainer: Szymon Scholz
#
# This package is archival package. Orphaned by developers. Source has expired, as the upstream url.
pkgname=huawei-stat-e220
pkgver=0.1
pkgrel=4
pkgdesc="HUAWEI E220 statistics interface"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20140830121640/http://oozie.fm.interia.pl/pro/huawei-e220/"
license=(GPL)
depends=('libusb')
source=(http://web.archive.org/web/20150802135657/http://oozie.fm.interiowo.pl/src/he220stat.tar.bz2)

build() {
  cd ${srcdir}/he220stat-*
  ./configure --prefix=/usr
  sed -i -e "s|/usr/local/bin|${pkgdir}/usr/bin|g" Makefile
  make
}

package() {
  cd ${srcdir}/he220stat-*
  mkdir -p "$pkgdir/usr/bin"

  make install
}
md5sums=('aa800f85183dc1990102846773fbefd9')
