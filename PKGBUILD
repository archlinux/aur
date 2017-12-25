# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=giseditor
pkgver=0.25
pkgrel=2
epoch=
pkgdesc="A gis editor for .gpx .gdb and download maps source"
arch=('any')
url="https://github.com/dayanuyim/GisEditor"
license=()
groups=()
depends=('gpsbabel' 'python-pmw' 'python-pillow' 'ttf-arphic-ukai')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/dayanuyim/GisEditor/archive/v0.25.tar.gz")
noextract=()
md5sums=("c5f0600a6d60486eb10d799f2ecd0671")
validpgpkeys=()
package() {
	mkdir -p $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/conf $pkgdir/opt/giseditor
	chmod -R a+x $pkgdir/opt/giseditor/conf
	cp -R $srcdir/GisEditor-$pkgver/data $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/doc $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/icon $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/mapcache $pkgdir/opt/giseditor
	chmod -R a+w $pkgdir/opt/giseditor/mapcache
	cp -R $srcdir/GisEditor-$pkgver/script $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/src $pkgdir/opt/giseditor
	cp -R $srcdir/GisEditor-$pkgver/main.py $pkgdir/opt/giseditor
	chmod +x $pkgdir/opt/giseditor/main.py 
	mkdir -p $pkgdir/usr/bin
	echo '#!/usr/bin/sh' > $pkgdir/usr/bin/giseditor
	echo 'python /opt/giseditor/main.py' >> $pkgdir/usr/bin/giseditor
	chmod +x $pkgdir/usr/bin/giseditor

	# TODO: install .desktop here and update mime type for os"
}
