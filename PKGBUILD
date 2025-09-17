pkgname=r00t
pkgver=2.0.0
pkgrel=2
pkgdesc="rt - root, das it"
arch=('x86_64')
url="https://github.com/theoddcell/rt"
license=('MIT')
depends=()
makedepends=('gcc')
source=("https://github.com/TheOddCell/rt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # replace 'SKIP' with actual sha256sum if you want verification

build() {
    cd "$srcdir/rt-${pkgver}"
    gcc -O2 -pipe -Wall -Wextra -std=gnu11 -o rt rt.c -lpam -lpam_misc
}

package() {
    cd "$srcdir/rt-${pkgver}"
    install -Dm755 rt "$pkgdir/usr/bin/rt"
    chmod 4750 "$pkgdir/usr/bin/rt"
    chown root:wheel "$pkgdir/usr/bin/rt"
}

