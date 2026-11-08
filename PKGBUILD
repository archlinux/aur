# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli-bin
pkgver=0.2.9 # renovate: datasource=github-releases depName=bluesky-social/goat
pkgrel=1
pkgdesc="Go AT protocol CLI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/bluesky-social/goat"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
options=('!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/bluesky-social/goat/releases/download/v$pkgver/goat_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/bluesky-social/goat/releases/download/v$pkgver/goat_Linux_arm64.tar.gz")
sha256sums_x86_64=('e16a5f29772f9420ac86f6e5c964a328882b5abbcc2d50bd7677acb1f9cf9f1d')
sha256sums_aarch64=('eef68d6c4d792b49323149adc1a33a8ab6f5c1b84f9786d3874fb0c05e12808d')

check() {
	./goat --help >/dev/null
}

package() {
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
