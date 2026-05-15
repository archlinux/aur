# Maintainer: Shiho Sakura <shiho@sakurastudios.eu>

pkgname=sakura-lslc
pkgver=1.0.0
pkgrel=1
pkgdesc="LSL (Linden Scripting Language) compiler — part of the Sakura LSL toolchain"
arch=('x86_64' 'aarch64')
url="https://github.com/Sakura-Studios-IKE/sakura-lslc"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sakura-Studios-IKE/sakura-lslc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/sakura-lslc-$pkgver"
    make
}

package() {
    cd "$srcdir/sakura-lslc-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
