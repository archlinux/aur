# Maintainer: mib <mib@kanp.ai>
pkgname=lightburn-bin
pkgver=1.6.01
pkgrel=1
pkgdesc="A layout, editing, and control software for lasercutters."
arch=('x86_64')
url="https://lightburnsoftware.com"
license=('unknown')
depends=('qt5-multimedia' 'qt5-serialport')
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('lightburn.sh' 'lightburn.desktop' "https://github.com/LightBurnSoftware/deployment/releases/download/$pkgver/LightBurn-Linux64-v$pkgver.7z")
sha256sums=('80d5fa4a142fe2741f8421250d00abdd2db5b16e6641446ed85de19814a1634e'
            'f72e86774d4396240b46e07e947edf9cdf5f8d526a70129c447fed7c173c4867'
            '019d94a5376aa7380217bd5041e2aea61e856b7f3c23f088a62c5875c0fb2cf8')

package() {
	mkdir -p "$pkgdir/usr/share/lightburn"
	cp -r "$srcdir/LightBurn"/* "$pkgdir/usr/share/lightburn"

	install -Dm755 "$srcdir/lightburn.sh" "$pkgdir/usr/bin/lightburn"
	install -Dm644 "lightburn.desktop" "$pkgdir/usr/share/applications/lightburn.desktop"
	install -Dm755 "$srcdir/LightBurn/LightBurn.png" "$pkgdir/usr/share/pixmaps/lightburn.png"
}
