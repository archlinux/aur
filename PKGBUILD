# Maintainer: Vincent Meadows <giantvince1@protonmail.com>
pkgname=debounced
pkgver=2.0
pkgrel=1
pkgdesc="Userspace keyboard debounce daemon with FlashTap support"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/VillageOfGamers/key-debouncer"
license=('GPL3')
depends=('libevdev' 'systemd')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "key-debouncer-$pkgver"
    make
}

package() {
    cd "key-debouncer-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr SYSTEMD_UNITDIR=/usr/lib/systemd/system
}
