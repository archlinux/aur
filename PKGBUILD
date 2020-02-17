# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=mask
pkgver=0.7.1
pkgrel=1
pkgdesc='A CLI task runner defined by a simple markdown file'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jakedeichert/mask"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dd66df3bcf1be3128a9a2bd78ff35d99d39b4008e622f373067c629eee444851')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
