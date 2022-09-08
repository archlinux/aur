# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=blueprint64
pkgver=0.20.0
pkgrel=0
epoch=
pkgdesc='A general-purpose ROMhacking tool for creating Super Mario 64 ROMhacks.'
arch=('x86_64')
url='https://blueprint64.ca/'
license=('GPL2')
groups=()
depends=(
	'glibc'
	'gcc-libs'
	'qt5-base'
	'qt5-svg'
	'which'
	'zlib'
)
makedepends=(
	'gcc'
	'qt5-declarative'
	'make'
)
optdepends=(
	'tar: required to load old blueprint formats'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='blueprint64.install'
changelog=
source=('https://gitlab.com/blueprint64/blueprint-64/uploads/75763ea95dc9261c0142cbdeec5e6847/blueprint64-0.20.0.tar.gz')
noextract=()
sha256sums=('6ecd9081bc63647a9a2432c7a1e717bb222927e001dd17dc2f5abb43067c007b')
validpgpkeys=()

build() {
	qmake-qt5 app.pro -spec linux-g++
	make -j `nproc`
}

package() {
	install -D blueprint64 $pkgdir/usr/bin/blueprint64
	install -D blueprint64.desktop $pkgdir/usr/share/applications/blueprint64.desktop
	install -D armips/armips $pkgdir/usr/share/blueprint64/armips-default
	install -D bbp-mime.xml $pkgdir/usr/share/blueprint64/bbp-mime.xml
	install -D data/mime/icon16.png $pkgdir/usr/share/icons/hicolor/16x16/mimetypes/application-x-bbp-blueprint.png
	install -D data/mime/icon22.png $pkgdir/usr/share/icons/hicolor/22x22/mimetypes/application-x-bbp-blueprint.png
	install -D data/mime/icon24.png $pkgdir/usr/share/icons/hicolor/24x24/mimetypes/application-x-bbp-blueprint.png
	install -D data/mime/icon32.png $pkgdir/usr/share/icons/hicolor/32x32/mimetypes/application-x-bbp-blueprint.png
	install -D data/mime/icon48.png $pkgdir/usr/share/icons/hicolor/48x48/mimetypes/application-x-bbp-blueprint.png
	install -D data/mime/icon64.png $pkgdir/usr/share/icons/hicolor/64x64/mimetypes/application-x-bbp-blueprint.png
}
