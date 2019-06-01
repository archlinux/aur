# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-gui
pkgver=0.8.0
pkgrel=1
pkgdesc="Java GUI for iniVation's Dynamic Vision (DV) C++ framework."
url="https://gitlab.com/inivation/$pkgname/"
license=('custom:Redistributable')
arch=('x86_64')
groups=()
depends=('dv-runtime' 'flashy' 'freetype2' 'alsa-lib' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst')
makedepends=()
provides=()
conflicts=()
replaces=()
options=()
source=("https://s3.eu-central-1.amazonaws.com/inivation-release/$pkgname-linux-$pkgver.tar.gz")
noextract=()
sha256sums=('7d77f07643e8444756fce8ac4d7855ac8a8b8101cf0812b2381ef82ed6ce7b8b')

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
