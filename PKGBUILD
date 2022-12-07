# Maintainer: Timo Kettenbach
pkgname=taschenrechner
pkgver=0.1.2
pkgrel=1
pkgdesc="a cli-calculator written in rust"
url="https://gitlab.fem-net.de/mabl/taschenrechner"
license=("MIT")
arch=("x86_64")
depends=()
makedepends=('rust')
provides=("taschenrechner")
conflicts=()
source=("https://gitlab.fem-net.de/mabl/taschenrechner/-/archive/${pkgver}/taschenrechner-${pkgver}.tar.gz")
sha256sums=('1124f772c51003f2e8094bdb27456c5d8a880e8d2dd389c6d4cf7c0143fc0dba')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release	
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 target/release/taschenrechner -t "$pkgdir/usr/bin"
    #install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
