# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: minmo com <dot> gmail <at> mike <dot> maroboro

pkgname=detekt-bin
pkgdesc="Static code analysis for Kotlin"
pkgver=1.22.0
pkgrel=1
arch=('any')
url="https://github.com/detekt/detekt"
license=('Apache')
depends=('java-runtime')
provides=("detekt-cli")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/detekt-cli-$pkgver.zip")
sha256sums=('7c3bc8e2b89493eb645e050a70186ecb34ecc14205381ad2e4110807d334413e')

PURGE_TARGETS=('*.bat')

package() {
	install -dv "$pkgdir/opt/detekt-cli/"
	install -dv "$pkgdir/usr/bin/"
	cp -av --no-preserve=ownership "detekt-cli-$pkgver/." "$pkgdir/opt/detekt-cli"
	ln -sv "/opt/detekt-cli/bin/detekt-cli" "$pkgdir/usr/bin/detekt-cli"
}
