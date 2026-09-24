# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli-bin
pkgver=0.2.5 # renovate: datasource=github-releases depName=bluesky-social/goat
pkgrel=4
pkgdesc="Go AT protocol CLI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/bluesky-social/goat"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
options=('!debug')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/bluesky-social/goat/releases/download/v$pkgver/goat_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/bluesky-social/goat/releases/download/v$pkgver/goat_Linux_arm64.tar.gz")
sha256sums_x86_64=('4d7eaa4e4e300f768038a9e98d30a82b5928f28e54da1addd783ed405c83d9b7')
sha256sums_aarch64=('6a92e998c093b05dc9bc7390837264f30f60d8e28deb1a59df1928a8a82ae663')

check() {
	./goat --help >/dev/null
}

package() {
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
