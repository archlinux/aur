# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=mikusays
pkgver=0.1.4
pkgrel=2
pkgdesc="A 'cowsay' clone with Hatsune Miku ASCII art and speech bubbles."
arch=('x86_64' 'aarch64')
url="https://github.com/xxanqw/mikusays"
license=('MIT')

source_x86_64=("$url/releases/download/v$pkgver-2/mikusays-linux-x64-$pkgver-2")
source_aarch64=("$url/releases/download/v$pkgver-2/mikusays-linux-arm64-$pkgver-2")

sha256sums_x86_64=('1371a8be0db49c5ea010f1ed928b873fb5d7e16e07631f4ef27e346180c7c3d8')
sha256sums_aarch64=('651bfdcce5942096df7e5de726d676acb28c4ec54321d390cbb635e5fb6914ca')

package() {
	# Install the correct binary based on the architecture
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "mikusays-linux-x64-$pkgver-2" "$pkgdir/usr/bin/mikusays"
	elif [ "$CARCH" = "aarch64" ]; then
		install -Dm755 "mikusays-linux-arm64-$pkgver-2" "$pkgdir/usr/bin/mikusays"
	fi
}
