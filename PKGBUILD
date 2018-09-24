# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=synology-drive
pkgver="1.1.2"
pkgrel="10562"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive')
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.2-10562/Ubuntu/Installer/i686/synology-drive-10562.i686.deb)
md5sums_i686=('6bbe69f93182e57384158102c7a95f70')

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.2-10562/Ubuntu/Installer/x86_64/synology-drive-10562.x86_64.deb)
md5sums_x86_64=('c192be1a247d2d25dd5f05574e3d8f51')

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