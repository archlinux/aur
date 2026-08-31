# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=mikusays
pkgver=0.1.5
pkgrel=1
pkgdesc="A 'cowsay' clone with Hatsune Miku ASCII art and speech bubbles."
arch=('x86_64' 'aarch64')
url="https://github.com/xxanqw/mikusays"
license=('MIT')
options=('!strip' '!debug')

source_x86_64=("$url/releases/download/v$pkgver/mikusays-linux-x64-$pkgver.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/mikusays-linux-arm64-$pkgver.tar.gz")

sha256sums_x86_64=('d5622717da3f0978c3d99ca8fab88ddcb539965b8ac751531b26118355a9d71f')
sha256sums_aarch64=('164843ac96dd94e05a6739eb704ebf0d86605fab27508e57b1014f3e8ed79df4')

package() {
	# Install the correct binary based on the architecture
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "mikusays-linux-x64-$pkgver" "$pkgdir/usr/bin/mikusays"
	elif [ "$CARCH" = "aarch64" ]; then
		install -Dm755 "mikusays-linux-arm64-$pkgver" "$pkgdir/usr/bin/mikusays"
	fi
}
