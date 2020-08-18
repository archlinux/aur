# Maintainer: Quentin Boyer <(firstname) at familleboyer DOT net>
pkgname=nextpass
pkgver=0.3.1
pkgrel=1
pkgdesc='CLI client for nextcloud passwords'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/traxys/nextpass'
license=('GPL3')
makedepends=('rust')
depends=('openssl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c7ce542e9d026df4814f9040fd5aa641faa7fe0709e32b2df3dca1bd25aef955')

build() {
	cd "$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
