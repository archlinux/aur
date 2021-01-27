# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo
pkgver=0.2.4
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/NerdyPepper/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c236c488069386b4662dd7ed4784ef7d8396fc8c197bd5032d3931d685fac0db')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
