# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname="synology-drive"
pkgver="2.0.3"
pkgrel="11102"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="https://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig' )
optdepends=('nautilus: For nautilus integration' )
conflicts=('cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive' )
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Utility/SynologyDriveClient/2.0.3-11102/Ubuntu/Installer/i686/synology-drive-client-11102.i686.deb)
md5sums_i686=('5739739f2d8a868518a9d43702460e1e')

source_x86_64=(https://global.download.synology.com/download/Utility/SynologyDriveClient/2.0.3-11102/Ubuntu/Installer/x86_64/synology-drive-client-11102.x86_64.deb)
md5sums_x86_64=('8be197272d8f25c5cc82a31621e2199c')

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
