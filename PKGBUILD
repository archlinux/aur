# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Contributor: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=geekbench
pkgver=6.0.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/k9ea2vqm/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('e3e724c7dad7879a5be3d885dc1a163b3d84d78bf60b501279c289aad55c610c9634ecfa46352b0ea9ad7946129e1cc97d8ef4f5970888f8ee03fcd7a2bf9475')
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
