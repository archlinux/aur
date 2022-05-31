# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=log4jscanner-bin
pkgver=0.5.0
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
sha256sums_x86_64=('6be8dfa1f23c0e37b9d291692fec0b0d00df41c6d591dbcda7415fa7e2d4866f')
sha256sums_aarch64=('0803439ccdb8556e27b193339306845aba2c5d47848773fbafe5b968c8598638')

package() {
	install -D log4jscanner/log4jscanner -t "$pkgdir/usr/bin/"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
