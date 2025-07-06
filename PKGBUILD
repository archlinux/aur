# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=mikusays
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple program that makes Miku say things"
arch=('x86_64' 'aarch64')
url="https://github.com/xxanqw/mikusays"
license=('MIT')

source_x86_64=("$url/releases/download/v$pkgver/mikusays-linux-x64")
source_aarch64=("$url/releases/download/v$pkgver/mikusays-linux-arm64")

sha256sums_x86_64=('a9b409e1d14256417e2db12c6cbc61b20d62afd37d6d3e2708a02aa3c1a06bd0')
sha256sums_aarch64=('6417bca50ef4f4ed61f5233670274916cf77e866ff83c235dc64626001a40869')

package() {
	# Install the correct binary based on the architecture
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "mikusays-linux-x64" "$pkgdir/usr/bin/mikusays"
	elif [ "$CARCH" = "aarch64" ]; then
		install -Dm755 "mikusays-linux-arm64" "$pkgdir/usr/bin/mikusays"
	fi
}
