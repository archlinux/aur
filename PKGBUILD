# Maintainer: Shiho Sakura <shiho@sakurastudios.eu>

pkgname=sakura-slemu
pkgver=1.0.0
pkgrel=1
pkgdesc="LSL bytecode emulator / Second Life runtime simulator — part of the Sakura LSL toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/Sakura-Studios-IKE/sakura-slemu"
license=('MIT')
depends=('glibc')
optdepends=('curl: for --http-real mode')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sakura-Studios-IKE/sakura-slemu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/sakura-slemu-$pkgver"
    make
}

package() {
    cd "$srcdir/sakura-slemu-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
