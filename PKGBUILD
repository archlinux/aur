# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=mikusays
pkgver=0.1.2
pkgrel=1
pkgdesc="A 'cowsay' clone with Hatsune Miku ASCII art and speech bubbles."
arch=('x86_64' 'aarch64')
url="https://github.com/xxanqw/mikusays"
license=('MIT')

source_x86_64=("$url/releases/download/v$pkgver/mikusays-linux-x64")
source_aarch64=("$url/releases/download/v$pkgver/mikusays-linux-arm64")

sha256sums_x86_64=('ba16cda3572ac1097cae53f042ffacd6883d9c38f2a5c708301c76b8f5d0a95d')
sha256sums_aarch64=('a87e0f765b140b12284f2bd2fc6abeda6feab52245b413e074eae495ca09a0d6')

package() {
	# Install the correct binary based on the architecture
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "mikusays-linux-x64" "$pkgdir/usr/bin/mikusays"
	elif [ "$CARCH" = "aarch64" ]; then
		install -Dm755 "mikusays-linux-arm64" "$pkgdir/usr/bin/mikusays"
	fi
}
