# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=synology-drive
pkgver="1.1.3"
pkgrel="10570"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive')
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.3-10570/Ubuntu/Installer/i686/synology-drive-10570.i686.deb)
md5sums_i686=('bf629124afe3f758e4534b840d81c494')

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.3-10570/Ubuntu/Installer/x86_64/synology-drive-10570.x86_64.deb)
md5sums_x86_64=('c14d8b0e379eb01a67a67d566985bb1a')

prepare() {
	cd "$srcdir"
	mkdir -p data
	ar x synology-drive-*
	xz -d data.tar.xz
	tar xf data.tar --directory data
}

package() {
	cp -r "$srcdir/data/opt" "$pkgdir/opt"
	cp -r "$srcdir/data/usr" "$pkgdir/usr"
}