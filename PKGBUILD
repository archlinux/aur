# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com> 
pkgname=giseditor
pkgver=0.26
pkgrel=4
epoch=
pkgdesc="A gis editor for .gpx .gdb and download maps source"
arch=('any')
url="https://github.com/dayanuyim/GisEditor"
license=()
groups=()
depends=('gpsbabel' 'python-pmw' 'python-pillow' 'ttf-arphic-ukai' 'python-numpy')
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

    python3 -c 'import image' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps image
    python3 -c 'import cycler' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps cycler
    python3 -c 'import matplotlib' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps matplotlib
    python3 -c 'import olefile' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps olefile
    python3 -c 'import pyparsing' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps pyparsing
    python3 -c 'import dateutil' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps python-dateutil
    python3 -c 'import pytz' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps pytz
    python3 -c 'import six' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps six
    python3 -c 'import timezonefinder' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps timezonefinder
    python3 -c 'import certifi' > /dev/null || python3 -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps certifi

	# TODO: update mime type gpx, gdb"

}
