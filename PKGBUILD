# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: BADGumby <badgumby at protonmail dot com>
# Contributor: stitran <tristan dot zuerl at gmx dot net>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Christian Berendt <christian at suppentopf dot net>

pkgname=boxes
pkgver=2.3.2
pkgrel=1
pkgdesc="Text mode box and comment drawing filter"
url="http://boxes.thomasjensen.com/"
arch=('i686' 'x86_64')
license=('GPL-3.0-only')
depends=('libunistring' 'ncurses' 'pcre2')
makedepends=('bison' 'flex')
source=("boxes-$pkgver.tar.gz::https://github.com/ascii-boxes/boxes/archive/refs/tags/v$pkgver.zip")
md5sums=('0f760d604c0fcded8f3b884e0b72454d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make GLOBALCONF=/etc/boxes-config
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 644 doc/boxes.1 $pkgdir/usr/share/man/man1/boxes.1
  install -D -m 644 boxes-config $pkgdir/etc/boxes-config
  install -D -m 755 out/boxes $pkgdir/usr/bin/boxes
}
