# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=log4jscanner-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="log4j vulnerability filesystem scanner for analyzing JAR files"
arch=('x86_64' 'aarch64')
url="https://github.com/google/log4jscanner"
license=('Apache')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("README-$pkgver.md::$url/raw/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/log4jscanner-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/log4jscanner-v$pkgver-linux-arm64.tar.gz")
sha256sums=('44c7873c18de286dee0a19e736ab989692ab075a45a523ea9b65c98a61508239')
sha256sums_x86_64=('255208acf259670f3fa0c01eccd4a704aeee6afe871441ca71e0c574c30e20a3')
sha256sums_aarch64=('9b024c537c808db1cd015a07d1aaaf5aa60d9bdca700e94a5522965250f56656')

package() {
	install -D log4jscanner/log4jscanner -t "$pkgdir/usr/bin/"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
