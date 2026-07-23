# Maintainer:  Radu Potop <radu at wooptoo dot com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Contributor: Hurricane Pootis <hurricanepootis@protonmail.com>

_binname=geekbench
pkgname=geekbench6
pkgver=6.7.1
pkgrel=2
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
options=('!strip')
sha256sums=('0ddca977deb6d9db4bd866485f9408e72e2869d0dea0737b18d4bfe472858ace')

package() {
    local dest="$pkgdir/opt/${pkgname}"
    install -D -m755 "$srcdir/Geekbench-${pkgver}-Linux/${pkgname}" "$dest/${pkgname}"
    install -D -m755 "$srcdir/Geekbench-${pkgver}-Linux/${_binname}_avx2" "$dest/${_binname}_avx2"
    install -D -m755 "$srcdir/Geekbench-${pkgver}-Linux/${_binname}_x86_64" "$dest/${_binname}_x86_64"
    install -D -m644 "$srcdir/Geekbench-${pkgver}-Linux/geekbench.plar" "$dest/geekbench.plar"
    install -D -m644 "$srcdir/Geekbench-${pkgver}-Linux/geekbench-workload.plar" "$dest/geekbench-workload.plar"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
