# Maintainer: Jake <ja.ke@posteo.de>
# Original Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>

pkgname=geekbench
pkgver=4.3.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('i686' 'x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
md5sums=('738d90d1849d646d5a86fa95bb0b118e')
options=('!strip')

package() {
install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_32 $pkgdir/opt/${pkgname}/${pkgname}_x86_32
install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_64 $pkgdir/opt/${pkgname}/${pkgname}_x86_64
install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}4 $pkgdir/opt/${pkgname}/
install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${pkgname}/geekbench.plar
mkdir -p $pkgdir/usr/bin
ln -s /opt/${pkgname}/${pkgname}4 $pkgdir/usr/bin/${pkgname}
}
