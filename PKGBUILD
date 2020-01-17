# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-gui
pkgver=1.0.9
pkgrel=1
pkgdesc="Java GUI for iniVation's Dynamic Vision (DV) C++ framework."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('custom:Redistributable')
arch=('x86_64')
groups=()
depends=('dv-runtime' 'flashy' 'freetype2' 'alsa-lib' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
makedepends=()
provides=()
conflicts=()
replaces=()
options=()
source=("http://release.inivation.com/gui/$pkgname-linux-$pkgver.tar.gz")
noextract=()
sha256sums=('5a6a0888b57b7da839411de820acd030475a11f2a0107a1d039aaab390043b4b')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$pkgdir"/usr/share/pixmaps/
	mv dv-gui.png "$pkgdir"/usr/share/pixmaps/

	mkdir -p "$pkgdir"/usr/share/applications/
	mv dv-gui.desktop "$pkgdir"/usr/share/applications/

	mkdir -p "$pkgdir"/usr/bin/
	mv dv-gui "$pkgdir"/usr/bin/

	mkdir -p "$pkgdir"/opt/dv-gui/
	mv * "$pkgdir"/opt/dv-gui/
}
