# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-gui
pkgver=1.3.0
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
sha256sums=('8f9f7601eefaf9561aef6c6d68a39a333b38aa4d7f798000f6eaa4a6971c2efa')

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
