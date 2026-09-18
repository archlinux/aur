# Maintainer:  Radu Potop <radu at wooptoo dot com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Contributor: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=geekbench
pkgver=7.1.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
options=('!strip')
sha256sums=('411b72a9c851b69e6f91d390649d419e2e625f475e3983880169651ca27a8672')

package() {
    local dest="$pkgdir/opt/${pkgname}"
    install -D -m755 "$srcdir/Geekbench-${pkgver}-Linux/${pkgname}7" "$dest/${pkgname}7"
    install -D -m755 "$srcdir/Geekbench-${pkgver}-Linux/${pkgname}_avx2" "$dest/${pkgname}_avx2"
    install -D -m755 "$srcdir/Geekbench-${pkgver}-Linux/${pkgname}_x86_64" "$dest/${pkgname}_x86_64"
    install -D -m644 "$srcdir/Geekbench-${pkgver}-Linux/geekbench.plxr" "$dest/geekbench.plxr"
    install -D -m644 "$srcdir/Geekbench-${pkgver}-Linux/geekbench-workload.plxr" "$dest/geekbench-workload.plxr"
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}7" "$pkgdir/usr/bin/${pkgname}"
}
