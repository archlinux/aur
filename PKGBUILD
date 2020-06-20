# Maintainer: iniVation AG <support@inivation.com>

pkgname=flashy
pkgver=1.5.4
pkgrel=1
pkgdesc="Java tool to handle firmware and logic flashing for iniVation devices."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('GPL2')
arch=('x86_64')
groups=()
depends=('freetype2' 'alsa-lib' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
makedepends=()
provides=()
conflicts=()
replaces=()
options=()
source=("http://release.inivation.com/$pkgname/$pkgname-linux-$pkgver.zip")
noextract=()
sha256sums=('')

package() {
	cd "$srcdir/$pkgname-linux-$pkgver"

	mkdir -p "$pkgdir"/usr/share/pixmaps/
	mv flashy.png "$pkgdir"/usr/share/pixmaps/

	mkdir -p "$pkgdir"/usr/share/applications/
	mv flashy.desktop "$pkgdir"/usr/share/applications/

	mkdir -p "$pkgdir"/opt/flashy/
	mv * "$pkgdir"/opt/flashy/

	mkdir -p "$pkgdir"/usr/bin/
	ln -s /opt/flashy/bin/flashy "$pkgdir"/usr/bin/flashy
}
