# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="anituner"
pkgdesc="Free software to create, edit and convert Windows animated cursors"

pkgver=2.0.0
pkgrel=1

arch=(i686 x86_64)

url="https://www.gdgsoft.com/anituner"
license=("freeware")

depends=(wine)
makedepends=(unzip)

provides=(anituner)

source=("https://download.gdgsoft.com/anitun2p.zip")
md5sums=("f0cff36790da5e3f9b02a65aa4d64101")

package() {
	# rename the default configuration file
	mv ${srcdir}/AniTunerPref.xml ${srcdir}/AniTunerPrefDefault.xml

	# make the required directories
	mkdir -p ${pkgdir}/usr/share/anituner
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/bin

	# copy the executable files
	cp -r ${srcdir}/* ${pkgdir}/usr/share/anituner

	# copy the .desktop file and the script
	cp -r ../anituner ${pkgdir}/usr/bin
	cp -r ../AniTuner.desktop ${pkgdir}/usr/share/applications
}