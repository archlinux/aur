# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=sonic3air-bin
pkgver=v20.11.07.0
pkgrel=2
pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles.'
arch=('x86_64')
url='https://sonic3air.org/'
license=('custom:CC BY-NC-SA 4.0')
makedepends=('gdown')
depends=('opengl-driver')
provides=(sonic3air)
source=(
	'sonic3air.tar.gz::https://drive.google.com/u/0/uc?id=1Dla-2cFgHFsf5H3bdQaXE6WuXohIr6ld'
	'sonic3air.desktop'
	'sonic3air.sh'
	'LICENSE.md')
sha256sums=(
	'83aaceb2696215d800066d2311a292628ac99572c883c962d31767edd0e33b3d'
	'89de50a3d32373db306f26f8b0e84423fe861e4af3c2a170cbd101421e689d6b'
	'0ac3f4ea42157e6956f85e1e68e7bd456104fd264d10dd2be43e4c38421b3426'
	'4bff643c05c2396b7e2987721c2f77cd3921434a0a2511f4a3bf31fc53fd7d76')
DLAGENTS=('https::/usr/bin/gdown -O %o %u')

package() {
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/sonic3air/LICENSE.md"
	install -Dm644 sonic3air.desktop "$pkgdir/usr/share/applications/sonic3air.desktop"
	install -Dm755 sonic3air.sh "$pkgdir/usr/bin/sonic3air"
	cd "$srcdir/sonic3air_game/"
	rm "setup_linux.sh"
	find . -type f -exec install -D {} "$pkgdir/opt/sonic3air/{}" \;
}
