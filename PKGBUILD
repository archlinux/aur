# Maintainer: Your Name <you@example.com>
pkgname=sysstatus
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI toolkit for viewing system status: CPU, memory, disk, processes, devices, and more"
arch=('x86_64')
url="https://github.com/SaisakthiM/sysstatus"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9dd38a9237f4cc49222112deb22545921a666c902a7bc4a2687d34a6716a0da4')  # replace with real checksum before submitting, see notes below

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
