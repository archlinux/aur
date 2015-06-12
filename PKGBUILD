# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=geekbench227
_pkgname=geekbench
pkgver=2.2.7
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance (last version to not require online access)"
arch=('i686' 'x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench")
source=("http://s3.amazonaws.com/geekbench/Geekbench-${pkgver}-Linux.tar.gz")
md5sums=('e62e986ca1424aedbe4ddedb52c95707')
options=('!strip')

package() {
install -D -m755 $srcdir/dist/Geekbench-${pkgver}-Linux/${_pkgname}_x86_32 $pkgdir/opt/${_pkgname}/${_pkgname}_x86_32
install -D -m755 $srcdir/dist/Geekbench-${pkgver}-Linux/${_pkgname}_x86_64 $pkgdir/opt/${_pkgname}/${_pkgname}_x86_64
install -D -m644 $srcdir/dist/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${_pkgname}/geekbench.plar
mkdir -p $pkgdir/usr/bin
[ "${CARCH}" = "i686" ] && ln -s /opt/${_pkgname}/${_pkgname}_x86_32 $pkgdir/usr/bin/${_pkgname} || \
ln -s /opt/${_pkgname}/${_pkgname}_x86_64 $pkgdir/usr/bin/${_pkgname}
}
