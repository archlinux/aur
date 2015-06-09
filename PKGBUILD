# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=kvasd-bin
pkgver=1.12
pkgrel=1
pkgdesc="A soft-decision Reed Solomon decoder for the JT65 mode"
arch=(i686 x86_64)
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
depends=(gcc-libs)
makedepends=()
replaces=(kvasd)
conflicts=(kvasd)

if [ "$CARCH" == "x86_64" ]; then
  source=("http://sourceforge.net/p/wsjt/wsjt/5245/tree/trunk/kvasd-binary/Linux-x86_64/kvasd?format=raw")
  md5sums=(703e519e256b51be9703283fe40048de)
else
  source=("http://sourceforge.net/p/wsjt/wsjt/5245/tree/trunk/kvasd-binary/Linux-i686/kvasd?format=raw")
  md5sums=(e43b0a42681c1f5129de4714e5606712)
fi
  
package() {
        mkdir -p $pkgdir/usr/bin
        cp "$srcdir/kvasd?format=raw" $pkgdir/usr/bin/kvasd
        chmod -R 755 $pkgdir/usr
}
