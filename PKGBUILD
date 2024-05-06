# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Contributor: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=geekbench
pkgver=6.3.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('0c0d89adea5c25cd6b9cc804fdbb5f3e53178ca3cf7b9505ab9c194f84f7d38274c1bc57651a073c50490e731ae1bbd56d13e388144a2529e9a556cef181ab6a')
options=('!strip')

package() {
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_64 $pkgdir/opt/${pkgname}/${pkgname}_x86_64
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_avx2 $pkgdir/opt/${pkgname}/${pkgname}_avx2
    install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${pkgname}/geekbench.plar
    install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench-workload.plar $pkgdir/opt/${pkgname}/geekbench-workload.plar
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}6 $pkgdir/opt/${pkgname}/
    install -d $pkgdir/usr/bin
    ln -s /opt/${pkgname}/${pkgname}6 $pkgdir/usr/bin/${pkgname}
}
