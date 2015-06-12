# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=geekbench
pkgver=3.2.2
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('i686' 'x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.primatelabs.com/Geekbench-${pkgver}-Linux.tar.gz")
md5sums=('f81720edd7b2dbb22523c62cd6846884')
options=('!strip')

package() {
install -D -m755 $srcdir/dist/Geekbench-${pkgver}-Linux/${pkgname}_x86_32 $pkgdir/opt/${pkgname}/${pkgname}_x86_32
install -D -m755 $srcdir/dist/Geekbench-${pkgver}-Linux/${pkgname}_x86_64 $pkgdir/opt/${pkgname}/${pkgname}_x86_64
install -D -m644 $srcdir/dist/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${pkgname}/geekbench.plar
mkdir -p $pkgdir/usr/bin
[ "${CARCH}" = "i686" ] && ln -s /opt/${pkgname}/${pkgname}_x86_32 $pkgdir/usr/bin/${pkgname} || \
ln -s /opt/${pkgname}/${pkgname}_x86_64 $pkgdir/usr/bin/${pkgname}
}
