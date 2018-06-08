# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=synology-drive
pkgver="1.0.3"
pkgrel="10281"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive')
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.0.3-10281/Ubuntu/Installer/i686/synology-drive-10281.i686.deb)
md5sums_i686=('60464b0d0ee6eaedf2ef44c7204b84b0')

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.0.3-10281/Ubuntu/Installer/x86_64/synology-drive-10281.x86_64.deb)
md5sums_x86_64=('caf40c2938232b3e4409b6c6d55d544b')

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