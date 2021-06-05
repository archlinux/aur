# Maintainer: David Barri <japgolly@gmail.com>
pkgname=verthash-miner-bin
pkgver=0.7.2
pkgrel=2
pkgdesc="GPU miner for the Verthash algorithm and Vertcoin"
arch=('x86_64')
url="https://github.com/CryptoGraphics/VerthashMiner"
license=('GPL-3.0')
source=("https://github.com/CryptoGraphics/VerthashMiner/releases/download/$pkgver/VerthashMiner-$pkgver-CUDA11-linux.tar.gz")
sha256sums=('a7c3e6b0a7a937eb9e9d88de24a16a7b13f518d858fffd07694a21bc724d9a8c')
provides=('verthash-miner')
conflicts=('verthash-miner')

package() {
	set -eu
	cd "$pkgdir/usr/bin"
	cd VerthashMiner-$pkgver-CUDA11-linux
	cp -r . "$pkgdir/opt/verthash-miner"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s ../../opt/verthash-miner/VerthashMiner verthash-miner
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/bin"
}
