# Maintainer: David Barri <japgolly@gmail.com>
pkgname=verthash-miner-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="GPU miner for the Verthash algorithm and Vertcoin"
arch=('x86_64')
url="https://github.com/CryptoGraphics/VerthashMiner"
license=('GPL-3.0')
source=("https://github.com/CryptoGraphics/VerthashMiner/releases/download/$pkgver/VerthashMiner-$pkgver-CUDA11-linux.tar.gz")
sha256sums=('767591f9dd0b3e80de369980df3d1d88d1527f0ebf99f90de13946e928cccdb7')
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
