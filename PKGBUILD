# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=synology-drive
pkgver="1.1.0"
pkgrel="10544"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive')
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.0-10544/Ubuntu/Installer/i686/synology-drive-10544.i686.deb)
md5sums_i686=('fa1d5ea782d48b790f8563b864faab92')

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.0-10544/Ubuntu/Installer/x86_64/synology-drive-10544.x86_64.deb)
md5sums_x86_64=('1deb3f38264d8f30e10776878bb30442')

prepare() {
	cd "$srcdir"
	mkdir control data
	ar x synology-drive-*
	tar xf data.tar.gz --directory data
}

package() {
	cp -r "$srcdir/data/opt" "$pkgdir/opt"
	cp -r "$srcdir/data/usr" "$pkgdir/usr"
}