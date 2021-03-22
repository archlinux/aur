# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=blueprint64
pkgver=0.18.0
pkgrel=1
epoch=
pkgdesc='A general-purpose ROMhacking tool for creating Super Mario 64 ROMhacks.'
arch=('x86_64')
url='https://blueprint64.ca/'
license=('GPL2')
groups=()
depends=(
	'glibc'
	'libstdc++5'
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
source=('https://gitlab.com/blueprint64/blueprint-64/uploads/8d691fbfd0ded92ac75228e483646cec/blueprint64-0.18.0.tar.gz')
noextract=()
md5sums=('2fea14b313e552bcfb9142c497a1d751')
validpgpkeys=()

build() {
	qmake-qt5 app.pro -spec linux-g++
	make
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
