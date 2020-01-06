pkgname=cdpr-lldp
pkgver=3.0.3
pkgrel=1
pkgdesc="A fork of CDPR to decode CDP and LLDP packets"
url="https://github.com/tdorssers/cdpr-3.0"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libpcap')
source=(https://github.com/tdorssers/cdpr-3.0/archive/master.zip
        compile-fix.patch)
md5sums=(SKIP
         '857bd9a491aa91452e81d8385d771b2c')

prepare() {
  cd $srcdir/cdpr-3.0-master
  patch -p1 -i ../compile-fix.patch
}

build() {
  cd $srcdir/cdpr-3.0-master
  make
}

package() {
  cd $srcdir/cdpr-3.0-master
  install -D -m 0755 $srcdir/cdpr-3.0-master/cdpr $pkgdir/usr/bin/cdpr
}
