# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>

pkgname=geekbench
pkgver=5.3.2
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('03225a4837c02745723f0d5f65439c20977bd16243c1ee2ab6d1540828b54778de93c82ca5688b3bfefe0dea4e41fda43fdda633a9b1685382fd549742d580a9')
options=('!strip')

package() {
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_64 $pkgdir/opt/${pkgname}/${pkgname}_x86_64
    install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${pkgname}/geekbench.plar
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}5 $pkgdir/opt/${pkgname}/
    install -d $pkgdir/usr/bin
    ln -s /opt/${pkgname}/${pkgname}5 $pkgdir/usr/bin/${pkgname}
}
