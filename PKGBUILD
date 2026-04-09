# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Contributor: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=geekbench
pkgver=6.7.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
options=('!strip')
sha256sums=('4a7b77d7bf517bfcf0c68a75a6fcd6177f535d78bc65406535607ebfbf98137f')

package() {
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_64 $pkgdir/opt/${pkgname}/${pkgname}_x86_64
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_avx2 $pkgdir/opt/${pkgname}/${pkgname}_avx2
    install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${pkgname}/geekbench.plar
    install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench-workload.plar $pkgdir/opt/${pkgname}/geekbench-workload.plar
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}6 $pkgdir/opt/${pkgname}/
    install -d $pkgdir/usr/bin
    ln -s /opt/${pkgname}/${pkgname}6 $pkgdir/usr/bin/${pkgname}
}
