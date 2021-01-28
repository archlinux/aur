# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dijo
pkgver=0.2.5
pkgrel=1
pkgdesc="Scriptable, curses-based, digital habit tracker"
arch=('x86_64')
url="https://github.com/NerdyPepper/dijo"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3e32e07e64af9b6c5c20a04c9c893accc8a95973df0ef519a096dd1c268eaef9')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
