# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=zet-bin
pkgver=0.2.5
pkgrel=1
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

b2sums_x86_64=('350b72d3f73b5396778da02c3e15fe312fbe42135835f92aa961bab569b2c38e14eb9e84e392cb359d7c19b4c38c1a6b027179a7e5bad59c4fcdc8a77c03df43')
b2sums_armv6h=('f18c959a8bfe383efee412152e03821557ff094ac766d880f0f89aff19f737b7567c0292df66251eb058ded631029ab176bdf8267e002697ba8b92666da2cc8c')
b2sums_armv7h=('f18c959a8bfe383efee412152e03821557ff094ac766d880f0f89aff19f737b7567c0292df66251eb058ded631029ab176bdf8267e002697ba8b92666da2cc8c')
b2sums_aarch64=('f18c959a8bfe383efee412152e03821557ff094ac766d880f0f89aff19f737b7567c0292df66251eb058ded631029ab176bdf8267e002697ba8b92666da2cc8c')

package() {
	cd "${pkgname%-bin}-$pkgver-"*
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
