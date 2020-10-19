# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>

pkgname=geekbench
pkgver=5.2.5
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('4350df0a39eecdb802f373440b21efc46df7c144c7fabeb3e6854512e5343af2332ae9d6d88a507d22f55d2e62de402f4650c51cebb696d19fce60b0937d2e2f')
options=('!strip')

package() {
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_64 $pkgdir/opt/${pkgname}/${pkgname}_x86_64
    install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${pkgname}/geekbench.plar
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}5 $pkgdir/opt/${pkgname}/
    install -d $pkgdir/usr/bin
    ln -s /opt/${pkgname}/${pkgname}5 $pkgdir/usr/bin/${pkgname}
}
