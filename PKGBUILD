# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>
pkgname=make-it-rain
pkgver=1.2.1
pkgrel=1
pkgdesc="Make it rain like it's 1999"
arch=('x86_64')
url="https://github.com/saltnpepper97/make-it-rain"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltnpepper97/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b18d39841f233548cdbec05f8bc652191eb9c45c9bad4413551fe40376d694c4')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/mir" "$pkgdir/usr/bin/mir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install man page
    install -Dm644 "mir.1" "$pkgdir/usr/share/man/man1/mir.1"
}
