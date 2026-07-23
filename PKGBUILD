# Maintainer: k.dani3 151220639+kdani3@users.noreply.github.com
pkgname=sony-tracker
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux head tracker for compatible Sony headphones, streams to OpenTrack over UDP"
arch=('x86_64')
url="https://github.com/kdani3/SonyTrackerLinux"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "SonyTrackerLinux-$pkgver"
    make
}

package() {
    cd "SonyTrackerLinux-$pkgver"
    install -Dm755 sony-tracker "$pkgdir/usr/bin/sony-tracker"
    install -Dm644 71-sony-head-tracker.rules "$pkgdir/usr/lib/udev/rules.d/71-sony-head-tracker.rules"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}