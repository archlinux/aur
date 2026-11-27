# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli-bin
pkgver=0.2.10 # renovate: datasource=github-releases depName=bluesky-social/goat
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
sha256sums_x86_64=('ad8f77d8a6df21ded5798adfcf41f34ce3b472cbafb1fe3f2e3fc5a3377218ac')
sha256sums_aarch64=('8129fd598627a154b1a06e19e6398042f076b8739aa0ca3bc3f687cd80f202ba')

check() {
	./goat --help >/dev/null
}

package() {
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
