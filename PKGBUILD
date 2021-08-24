# Maintainer: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=btrfs-snapshots
pkgver=0.1.0
pkgrel=2
pkgdesc="Manage collections of btrfs snapshots"
arch=('any')
url="https://gitlab.com/jmcantrell/$pkgname"
license=('GPL3')
depends=('btrfs-progs')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('9545b96e619aabec0981487d3aaa51eedabf8a316b0a312568f71276a08f6920')

check() {
    cd "$srcdir/$pkgname-v$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    PREFIX=$pkgdir make install
}
