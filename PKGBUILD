# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com> 
pkgname=giseditor
pkgver=0.26
pkgrel=3
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
source=(
    "https://github.com/dayanuyim/GisEditor/archive/v0.26.tar.gz"
    "giseditor.sh"
)
noextract=()
md5sums=(
    "4c04ae03af817f3942cf2a6340e3f0a0"
    "f1896415d3e9488a9b3ff3545ae3911f"
)
validpgpkeys=()
package() {
    install -d ${pkgdir}/opt
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

    install -d "$pkgdir"/usr/bin
    install -D -m755 "./giseditor.sh" "${pkgdir}/usr/bin/giseditor"

    install -D -m644 $srcdir/GisEditor-$pkgver/install/linux/giseditor.desktop "${pkgdir}/usr/share/applications/GisEditor.desktop"

	# TODO: update mime type gpx, gdb"

}
