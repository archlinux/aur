# Maintainer: Shiho Sakura <shiho@sakurastudios.eu>

pkgname=sakura-lsldb
pkgver=1.0.0
pkgrel=2
pkgdesc="LSL debugger frontend — drives sakura-slemu for interactive script debugging"
arch=('x86_64' 'aarch64')
url="https://github.com/Sakura-Studios-IKE/sakura-lsldb"
license=('MIT')
depends=('glibc' 'sakura-slemu')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sakura-Studios-IKE/sakura-lsldb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/sakura-lsldb-$pkgver"
    make
}

package() {
    cd "$srcdir/sakura-lsldb-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
