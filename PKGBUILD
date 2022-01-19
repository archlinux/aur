# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=log4jscanner-bin
pkgver=0.3.0
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
sha256sums=('14447b4c2a852448419f69b2642b4a2aa3b21027aaa4ebe4264f7c4045c78b7d')
sha256sums_x86_64=('c381bc3dea0fc648cb1f7752bb06c51a6f64aad17bd9e352f0ee38ff5e361509')
sha256sums_aarch64=('b7eb0453ffce1f98aab522a9f37fd3ea39b6ab3dacd1759ac54260a20bd828a1')

package() {
	install -D log4jscanner/log4jscanner -t "$pkgdir/usr/bin/"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
