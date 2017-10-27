# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=opera-mobile-emulator
pkgver=12.1
pkgrel=1
pkgdesc='Emulator of Opera Mobile browser. Discontinued.'
arch=('i686' 'x86_64')
url='https://www.opera.com/pl/developer/mobile-emulator'
depends=('lib32-glibc' 'lib32-qt4')
source=(
	"package.tar.gz::https://www.opera.com/download/get.pl?sub=++++&id=35129&location=360&nothanks=yes"
	"opera-mobile-emulator.desktop"
)
sha256sums=(
	"af7a6ec8c8ae3fdf84ea14b9cbfe032fa7af36ead510ae7ca5f295791a96889b"
	"5fa546d72ffc70508fcd289ba0ebc17c0dd3868c12c707ede8764c908881b8a7"
)

package() {
	mkdir -p "$pkgdir/opt/opera-mobile-emulator" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"

	cp -R "$srcdir/Opera_Mobile_Emulator_12.1_Linux/"* "$pkgdir/opt/opera-mobile-emulator/"
	ln -s "/opt/opera-mobile-emulator/opera-mobile-emulator-launcher" "$pkgdir/usr/bin/opera-mobile-emulator"

	cp "$srcdir/opera-mobile-emulator.desktop" "$pkgdir/usr/share/applications"
}