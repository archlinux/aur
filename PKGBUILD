# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=synology-drive
pkgver="1.0.1"
pkgrel="10253"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta', 'cloudstation-3.0', 'cloudstation-drive')
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.0.1-10253/Ubuntu/Installer/i686/synology-drive-10253.i686.deb)
md5sums_i686=('9a4a8bfa04da9bc972c8128cfea440d9')

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.0.1-10253/Ubuntu/Installer/x86_64/synology-drive-10253.x86_64.deb)
md5sums_x86_64=('a1cf7c7b7a809c6e0da1f99906f31c8d')

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