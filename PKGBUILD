# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-gui
pkgver=1.0.8
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
sha256sums=('ca6f7602ffdacd87a55f6a0f1eb26ea6e3751d09e8acb8c3f42254814807ac9a')

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
