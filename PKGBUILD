# Maintainer: Ivan Potiienko <contact@xxanqw.pp.ua>
pkgname=mikusays
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple program that makes Miku say things"
arch=('x86_64' 'aarch64')
url="https://github.com/xxanqw/mikusays"
license=('MIT')

source_x86_64=("$url/releases/download/v$pkgver/mikusays-linux-x64")
source_aarch64=("$url/releases/download/v$pkgver/mikusays-linux-arm64")

sha256sums_x86_64=('a6c5a4a94084e3375f0a556f38d07b82a86d18fc8c706b89387db6658169d720')
sha256sums_aarch64=('c9e23976e81b106c95e1b9e16911178374fd6e32997f4b7d4244ac95feccde85')

package() {
	# Install the correct binary based on the architecture
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 "mikusays-linux-x64" "$pkgdir/usr/bin/mikusays"
	elif [ "$CARCH" = "aarch64" ]; then
		install -Dm755 "mikusays-linux-arm64" "$pkgdir/usr/bin/mikusays"
	fi
}