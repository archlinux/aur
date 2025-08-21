# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
pkgname=make-it-rain
pkgver=1.1.1
pkgrel=1
pkgdesc="Make it rain like it's 1999"
arch=('x86_64')
url="https://github.com/saltnpepper97/make-it-rain"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltnpepper97/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/mir" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "target/release/mir" "$pkgdir/usr/bin/mir"
    install -Dm755 "target/release/mir" "$pkgdir/usr/bin/mir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
