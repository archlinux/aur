# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Christian Berendt <christian@suppentopf.net>

pkgname=boxes
pkgver=1.1.2
pkgrel=1
pkgdesc="Text mode box and comment drawing filter"
url="http://boxes.thomasjensen.com/"
arch=('i686' 'x86_64')
license=('GPL')
source=("https://github.com/ascii-boxes/boxes/archive/v$pkgver.zip")
md5sums=('b73a4e2f3bc8a99bc4030f6ccb0f04d3')

build() {
  cd $srcdir/$pkgname-$pkgver
  make GLOBALCONF=/etc
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 644 doc/boxes.1 $pkgdir/usr/share/man/man1/boxes.1
  install -D -m 644 boxes-config $pkgdir/etc/boxes-config
  install -D -m 755 src/boxes $pkgdir/usr/bin/boxes
}
