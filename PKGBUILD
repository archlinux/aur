# Maintainer: iniVation AG <support@inivation.com>

pkgname=flashy
pkgver=1.5.1
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
source=("http://release.inivation.com/$pkgname/$pkgname-linux-$pkgver.tar.gz")
noextract=()
sha256sums=('5b2056b758ca005905e1cac2d02857b5a0a17c15e92c71ab41963dfe9d782637')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$pkgdir"/usr/share/pixmaps/
	mv flashy.png "$pkgdir"/usr/share/pixmaps/

	mkdir -p "$pkgdir"/usr/share/applications/
	mv flashy.desktop "$pkgdir"/usr/share/applications/

	mkdir -p "$pkgdir"/opt/flashy/
	mv * "$pkgdir"/opt/flashy/

	mkdir -p "$pkgdir"/usr/bin/
	ln -s /opt/flashy/bin/flashy "$pkgdir"/usr/bin/flashy
}
