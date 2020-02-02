# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=rargs
pkgver=0.2.3
pkgrel=1
pkgdesc='A kind of xargs + awk with pattern-matching support'
arch=('i686' 'x86_64')
url="https://github.com/lotabout/rargs"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b33205cab0d410cd7f25e3bcb4efbfec48de76a8ad9c01ee4c286e407552f982')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
