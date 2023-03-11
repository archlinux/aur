# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Contributor: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=geekbench
pkgver=6.0.1
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('37e143c79d26aba20f272b1367ee693537b363ea746e0f6978e338088716afe2f8b8c7646524235b3707da26da93ea2a00f6aa3bdd586949ec9a35ecb939297c')
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
