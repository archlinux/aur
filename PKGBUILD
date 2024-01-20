# Maintainer: Ilyas Turki <turki.ilyass@gmail.com>
pkgname=prayer-times
pkgver=0.1.0
pkgrel=1
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Islamic Prayer Times Notification"
url="https://github.com/Yasso9/prayer-times"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Yasso9/prayer-times/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo check
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
