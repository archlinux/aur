# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Christian Berendt <christian@suppentopf.net>

pkgname=boxes
pkgver=1.1.2
pkgrel=3
pkgdesc="Text mode box and comment drawing filter"
url="http://boxes.thomasjensen.com/"
arch=('i686' 'x86_64')
license=('GPL')
source=("https://github.com/ascii-boxes/boxes/archive/v$pkgver.zip")
md5sums=('4951b407b478ac42f7efc0ece4d5e355')

build() {
  cd $srcdir/$pkgname-$pkgver
  make GLOBALCONF=/etc/boxes-config
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 644 doc/boxes.1 $pkgdir/usr/share/man/man1/boxes.1
  install -D -m 644 boxes-config $pkgdir/etc/boxes-config
  install -D -m 755 src/boxes $pkgdir/usr/bin/boxes
}
