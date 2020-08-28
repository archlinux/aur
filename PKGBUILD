# Maintainer: Quentin Boyer <(firstname) at familleboyer DOT net>
pkgname=nextpass
pkgver=0.4.0
pkgrel=1
pkgdesc='CLI client for nextcloud passwords'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/traxys/nextpass'
license=('GPL3')
makedepends=('rust')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4d72674a4180b22f3e3d8b1e43eeb7b4d708c5dcad9dbc003accb47a34f9b954')

build() {
	cd "$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
