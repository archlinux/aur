# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=log4jscanner-bin
pkgver=0.2.0
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
sha256sums=('2eb7b49dc4fde2129c473405343d108abdafef86db5171ea41f039e29a9d5979')
sha256sums_x86_64=('8156a0a36e8184831e8bf7acbd285e55e9bc2bda041778a74f8bfc2e7c18dc22')
sha256sums_aarch64=('939f1b3d332b0493e09caa82ee1da82f5c2643d2570737a26539dad268a1e966')

package() {
	install -D log4jscanner/log4jscanner -t "$pkgdir/usr/bin/"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
