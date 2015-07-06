# Maintainer: Boohbah <boohbah@gmail.com>
pkgname=emutools
pkgver=113001
pkgrel=1
pkgdesc="Utilities to handle GB, GBA, and NES ROM images"
arch=('i686' 'x86_64')
url="http://fms.komkon.org/EMUL8/EMUTools.html"
license=('unknown')
depends=('zlib')
makedepends=('zlib')
source=("http://fms.komkon.org/EMUL8/EMUTools-$pkgver.tar.Z"
        'Makefile')
md5sums=('b714891678e9fbf2cfe96123216db4aa'
         '904ef4c188c5d20c4c14e759fb61f131')

build() {
  cd $srcdir
  make
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir/usr/bin" install
}

# vim:set ts=2 sw=2 et:
