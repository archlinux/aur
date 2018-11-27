# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com> 
pkgname=giseditor
pkgver=0.27
pkgrel=1
epoch=
pkgdesc="A gis editor for .gpx .gdb and download maps source"
arch=('any')
url="https://github.com/dayanuyim/GisEditor"
license=()
groups=()
depends=('gpsbabel' 'python-pmw' 'python-pillow' 'python-numpy' 'python-cycler' 'python-matplotlib' 'python-olefile' 'python-pyparsing' 'python-dateutil' 'python-pytz' 'python-six' 'python-certifi' 'ttf-droid' 'python-image' 'python-timezonefinder')
makedepends=()
checkdepends=()
optdepends=('ttf-arphic-ukai' )
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/dayanuyim/GisEditor/archive/v0.27.tar.gz"
    "giseditor.sh"
)
noextract=()
md5sums=(
    "17c94da35f3990097e7e9609e41b1f0f"
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
