# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=log4jscanner-bin
pkgver=0.1.0
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
sha256sums=('7d9fcfd9146368397b298eb13d347b0f6ef46abf8a0f290b8f1fdbdddf99ffcc')
sha256sums_x86_64=('ad9e44063078624e9c440b5d8024d516dc907025fdeadf44726c8e407a8bfd3a')
sha256sums_aarch64=('3f519ada8309256f69ea9e281b6153aaceb5ebd1b726acbba520e36e1650a23b')

package() {
	install -D log4jscanner/log4jscanner -t "$pkgdir/usr/bin/"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
