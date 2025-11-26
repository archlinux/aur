# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=mikusays
pkgver=0.1.4
pkgrel=1
pkgdesc="A 'cowsay' clone with Hatsune Miku ASCII art and speech bubbles."
arch=('x86_64' 'aarch64')
url="https://github.com/xxanqw/mikusays"
license=('MIT')

source_x86_64=("$url/releases/download/v$pkgver/mikusays-linux-x64-$pkgver")
source_aarch64=("$url/releases/download/v$pkgver/mikusays-linux-arm64-$pkgver")

sha256sums_x86_64=('12e0670de5a316d17562008a079cb036d7ecc17d34588b47533aceae409860b7')
sha256sums_aarch64=('38da31364e88a6554b1210d043fb00463d09ab37eb75612f0cdfb0f48b2aea28')

package() {
	# Install the correct binary based on the architecture
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "mikusays-linux-x64-$pkgver" "$pkgdir/usr/bin/mikusays"
	elif [ "$CARCH" = "aarch64" ]; then
		install -Dm755 "mikusays-linux-arm64-$pkgver" "$pkgdir/usr/bin/mikusays"
	fi
}
