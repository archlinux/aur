# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=zet-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='CLI utility to find the union, intersection, set difference, etc of files considered as sets of lines'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/yarrow/${pkgname%-bin}"
license=('APACHE' 'MIT')
# The arm version is dynamically linked
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/${pkgname%-bin}-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-armhf.tar.gz::$url/releases/download/$pkgver/${pkgname%-bin}-${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv6h=("$pkgname-$pkgver-armhf.tar.gz::$url/releases/download/$pkgver/${pkgname%-bin}-${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$pkgname-$pkgver-armhf.tar.gz::$url/releases/download/$pkgver/${pkgname%-bin}-${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")

b2sums_x86_64=('d0714f6800a1534da807dbc6006ec326f24b30d1a63e2235d6ed6dff4becace9a8b53f4bead479f5684bbed0b4724515e1cb33892d71275f727def1ec588c423')
b2sums_armv6h=('e32f5b50495d669b595be1f74354c771f5c3cce5ec8b4869cd93ff532a890986222e3f26f4137dd459e07891637152df532f0139b787dd42be3805c4ad7c33a2')
b2sums_armv7h=('e32f5b50495d669b595be1f74354c771f5c3cce5ec8b4869cd93ff532a890986222e3f26f4137dd459e07891637152df532f0139b787dd42be3805c4ad7c33a2')
b2sums_aarch64=('e32f5b50495d669b595be1f74354c771f5c3cce5ec8b4869cd93ff532a890986222e3f26f4137dd459e07891637152df532f0139b787dd42be3805c4ad7c33a2')

package() {
	cd "${pkgname%-bin}-$pkgver-"*
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
