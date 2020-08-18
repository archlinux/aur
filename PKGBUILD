# Maintainer: Quentin Boyer <(firstname) at familleboyer DOT net>
pkgname=nextpass
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI client for nextcloud passwords'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/traxys/nextpass'
license=('GPL3')
makedepends=('rust')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f1f9ca69880d0d03ae92a1545ef58eee7c26a9593218a2e72723c242a2fb15a2')

build() {
	cd "$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
