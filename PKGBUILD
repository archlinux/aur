# Maintainer: David Barri <japgolly@gmail.com>
pkgname=verthash-miner
pkgver=0.7.2
pkgrel=2
pkgdesc="GPU miner for the Verthash algorithm and Vertcoin"
arch=('x86_64')
url="https://github.com/CryptoGraphics/VerthashMiner"
license=('GPL-3.0')
makedepends=(cmake git make)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')
conflicts=('verthash-miner-bin')

build() {
	set -eu
  MAKE_BUILD_TYPE=Release
  MAKE_VERBOSE_MAKEFILE=TRUE
	pmake
}

package() {
	set -eu
	cd VerthashMiner

	install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 VerthashMiner "$pkgdir/usr/bin/verthash-miner"
}
