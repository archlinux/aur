# Maintainer: Simon Jackson <sizeak at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: minmo com <dot> gmail <at> mike <dot> maroboro

pkgname=detekt-bin
pkgdesc="Static code analysis for Kotlin"
pkgver=1.23.8
pkgrel=1
arch=('any')
url="https://github.com/detekt/detekt"
license=('Apache')
depends=('java-runtime')
provides=("detekt-cli")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/detekt-cli-$pkgver.zip")
sha256sums=('ff9f9258879ff2ec4349114740221498afec46a85cf6302c9f80b06eb4429501')

PURGE_TARGETS=('*.bat')

package() {
	install -dv "$pkgdir/opt/detekt-cli/"
	install -dv "$pkgdir/usr/bin/"
	cp -av --no-preserve=ownership "detekt-cli-$pkgver/." "$pkgdir/opt/detekt-cli"
	ln -sv "/opt/detekt-cli/bin/detekt-cli" "$pkgdir/usr/bin/detekt-cli"
}
