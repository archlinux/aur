pkgname=r00t
pkgver=3.0.0
pkgrel=1
pkgdesc="rt - root, das it"
arch=('x86_64')
url="https://github.com/theoddcell/rt"
license=('MIT')
depends=()
makedepends=('gcc')
source=("https://github.com/TheOddCell/rt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/rt-${pkgver}"
    gcc -O2 -o rt rt.c
}

package() {
    cd "$srcdir/rt-${pkgver}"
    install -Dm755 rt "$pkgdir/usr/bin/rt"
    chmod 4755 "$pkgdir/usr/bin/rt"
    chown root:root "$pkgdir/usr/bin/rt"
}

