# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=sonic3air-bin
pkgver=v20.11.07.0
pkgrel=1
pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles.'
arch=('x86_64')
url='https://sonic3air.org/'
license=('unknown')
makedepends=('gdown')
provides=(sonic3air)
source=(
	'sonic3air.tar.gz::https://drive.google.com/u/0/uc?id=1Dla-2cFgHFsf5H3bdQaXE6WuXohIr6ld'
	'sonic3air.desktop'
	'sonic3air.sh')
sha256sums=(
	'83aaceb2696215d800066d2311a292628ac99572c883c962d31767edd0e33b3d'
	'7c5568d01131935c189b3060ea0319cc0047c8a76c9152bf5d461e70f676eebd'
	'0ac3f4ea42157e6956f85e1e68e7bd456104fd264d10dd2be43e4c38421b3426')
DLAGENTS=('https::/usr/bin/gdown -O %o %u')

package() {
	install -Dm644 sonic3air.desktop "$pkgdir/usr/share/applications/sonic3air.desktop"
	install -Dm755 sonic3air.sh "$pkgdir/usr/bin/sonic3air"
	cd "$srcdir/sonic3air_game/"
	rm "setup_linux.sh"
	find . -type f -exec install -D {} "$pkgdir/opt/sonic3air/{}" \;
}
