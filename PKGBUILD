# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli-bin
pkgver=0.2.7 # renovate: datasource=github-releases depName=bluesky-social/goat
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
sha256sums_x86_64=('691edc92ea497e675b8d2c7c7272e9e938abf02c32d800d091adade07983896d')
sha256sums_aarch64=('76a261527e51f2bf0020aab6aa9e9e6cdbf8167f21f66d349df0ebe1f9f6c4f5')

check() {
	./goat --help >/dev/null
}

package() {
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
