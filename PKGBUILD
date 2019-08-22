# Maintainer: robertfoster

pkgname=iortcw-data
pkgver=1.51c
pkgrel=3
pkgdesc="Return to Castle Wolfenstein Single Player pk3s files (shared use)"
arch=('any')
url="https://github.com/iortcw/iortcw"
license=('GPL')
install='iortcw-data.install'
source=("https://github.com/iortcw/iortcw/releases/download/$pkgver/patch-data-141.zip"
	"https://github.com/M0Rf30/rtcw-assets/raw/master/sp_pak2.pk3"
	"https://github.com/M0Rf30/rtcw-assets/raw/master/mp_pak1.pk3"
	"https://github.com/M0Rf30/rtcw-assets/raw/master/mp_pak2.pk3"
'openurl.sh')
noextract=('sp_pak2.pk3' 'mp_pak1.pk3' 'mp_pak2.pk3')

package() {

	cd $srcdir/main
	# Clean unneeded files
	rm *.so *.dll

	# Move Data to Package Directory
	mkdir -p $pkgdir/opt/iortcw-data
	cp -r * $pkgdir/opt/iortcw-data/
	cp ../sp_pak2.pk3 $pkgdir/opt/iortcw-data/
	cp ../mp_pak1.pk3 $pkgdir/opt/iortcw-data/
	cp ../mp_pak2.pk3 $pkgdir/opt/iortcw-data/
	install -D -m 755 ../openurl.sh $pkgdir/opt/iortcw-data/
}
md5sums=('291a37caa9d65d0b81f767918b76fa56'
	'330b272d5261fe19fcf3c3fbc943c7f3'
	'22b972974f499a237c96a2200b0d019e'
	'30f29ffa81748a957e0441af8c14cb56'
'11a60b83bcfb4b953344db248d886000')
