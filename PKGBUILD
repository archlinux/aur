# shellcheck disable=SC2154
# Maintainer: Bas <hi@bas.sh>
pkgname=goat-cli-bin
pkgver=0.2.6 # renovate: datasource=github-releases depName=bluesky-social/goat
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
sha256sums_x86_64=('e132ed3fdd8caa9e0ba8daf467ac70a0913d513d664bab73af5113088c9e6276')
sha256sums_aarch64=('eab4befb717ba6b9bc730e3afa5490798ce1cd91a86b8285680d1677c594a8d5')

check() {
	./goat --help >/dev/null
}

package() {
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
