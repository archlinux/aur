# Maintainer: David Barri <japgolly@gmail.com>
pkgname=verthash-miner-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="GPU miner for the Verthash algorithm and Vertcoin"
arch=('x86_64')
url="https://github.com/CryptoGraphics/VerthashMiner"
license=('GPL-3.0')
source=("https://github.com/CryptoGraphics/VerthashMiner/releases/download/$pkgver/VerthashMiner-$pkgver-CUDA11-linux.tar.gz")
sha256sums=('a629cf6f229760df342a29829ccf7ca9f717640a50a9eeeddf16bcc7f16b9aba')
provides=('verthash-miner')
conflicts=('verthash-miner')

package() {
	set -eu

	cd VerthashMiner-$pkgver-CUDA11-linux

	mkdir -p "$pkgdir/opt"
	cp -r . "$pkgdir/opt/verthash-miner"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/bin"
	cd "$pkgdir/usr/bin"
	ln -s ../../opt/verthash-miner/VerthashMiner verthash-miner
}
