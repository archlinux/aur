# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=mikusays
pkgver=0.1.3
pkgrel=1
pkgdesc="A 'cowsay' clone with Hatsune Miku ASCII art and speech bubbles."
arch=('x86_64' 'aarch64')
url="https://github.com/xxanqw/mikusays"
license=('MIT')

source_x86_64=("$url/releases/download/v$pkgver/mikusays-linux-x64")
source_aarch64=("$url/releases/download/v$pkgver/mikusays-linux-arm64")

sha256sums_x86_64=('52a38f4ca13e90bf93b2dd90502a4c04cd8c903ed4fb9200e1f15d1d009f05d9')
sha256sums_aarch64=('06d5f9012d6b4c9b011f148724a15affb71e5fd4a71eff908a35fa832f674e0b')

package() {
	# Install the correct binary based on the architecture
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "mikusays-linux-x64" "$pkgdir/usr/bin/mikusays"
	elif [ "$CARCH" = "aarch64" ]; then
		install -Dm755 "mikusays-linux-arm64" "$pkgdir/usr/bin/mikusays"
	fi
}
