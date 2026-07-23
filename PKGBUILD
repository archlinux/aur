# Maintainer:  Radu Potop <radu at wooptoo dot com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>
# Contributor: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=geekbench
pkgver=7.0.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('x86_64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
conflicts=("geekbench227")
source=("http://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
options=('!strip')
sha256sums=('961a00ac0ac432ffa6874764e86c59d2e098fff65b5b398bb9381bf7fc46c81b')

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
