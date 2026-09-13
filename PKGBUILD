# Maintainer: Vincent Meadows <giantvince1@protonmail.com>
pkgname=debounced
pkgver=2.2
pkgrel=1
pkgdesc="Userspace keyboard debounce daemon with FlashTap support"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://codeberg.com/Giantvince1/key-debouncer"
license=('GPL3')
depends=('libevdev' 'systemd')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6b627cf51d04dccb164d5a338fac9d1455a039897def9dcb2c5905d4ef693384')

build() {
    cd "key-debouncer"
    make
}

package() {
    cd "key-debouncer"
    make install DESTDIR="$pkgdir" PREFIX=/usr SYSTEMD_UNITDIR=/usr/lib/systemd/system
}
