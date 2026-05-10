# Maintainer: Andrey Burov <burik666@gmail.com>
pkgname=lynxdb
pkgver=0.1.8
pkgrel=1
pkgdesc='https://github.com/lynxbase/lynxdb/archive/v0.1.8.tar.gz'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url='https://github.com/lynxbase/lynxdb/archive/refs/tags/v0.1.8.tar.gz'
license=('Apache-2.0 license')
makedepends=('go>=1.25' 'git' 'bun' 'make')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lynxbase/lynxdb/archive/v$pkgver.tar.gz")
sha256sums=('66875ecf1763353a3a903c6ae15568542052dfb7a551610f254308a733fc9e5a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make webui build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -p -m 755 -D -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/lynxdb"
    install -m 644 -D -t "$pkgdir/usr/share/$pkgname/" "$srcdir/$pkgname-$pkgver/README.md"
}
