# Maintainer: Simon Jackson <sizeak at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: minmo com <dot> gmail <at> mike <dot> maroboro

pkgname=detekt-bin
pkgdesc="Static code analysis for Kotlin"
pkgver=1.23.4
pkgrel=1
arch=('any')
url="https://github.com/detekt/detekt"
license=('Apache')
depends=('java-runtime')
provides=("detekt-cli")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/detekt-cli-$pkgver.zip")
sha256sums=('f30551c442a63c5a9b15c3223f510ae95139a53c37b82e6bb03d6164c9100c1a')

PURGE_TARGETS=('*.bat')

package() {
	install -dv "$pkgdir/opt/detekt-cli/"
	install -dv "$pkgdir/usr/bin/"
	cp -av --no-preserve=ownership "detekt-cli-$pkgver/." "$pkgdir/opt/detekt-cli"
	ln -sv "/opt/detekt-cli/bin/detekt-cli" "$pkgdir/usr/bin/detekt-cli"
}
