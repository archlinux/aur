# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>

pkgname=geekbench
pkgver=5.3.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('fbd9d63be7687c6c4238ab37061bff9472611628b496384cb1297ef70308c6059eba25477d7e8492fca6fb3ef3b33d5d059089e184a7fa094f0de3f8f1f9264f')
options=('!strip')

package() {
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_64 $pkgdir/opt/${pkgname}/${pkgname}_x86_64
    install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/geekbench.plar $pkgdir/opt/${pkgname}/geekbench.plar
    install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname}5 $pkgdir/opt/${pkgname}/
    install -d $pkgdir/usr/bin
    ln -s /opt/${pkgname}/${pkgname}5 $pkgdir/usr/bin/${pkgname}
}
