# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname="synology-drive"
pkgver="2.0.4"
pkgrel="11112"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="https://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig' )
optdepends=('nautilus: For nautilus integration' )
conflicts=('cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive' )
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Utility/SynologyDriveClient/2.0.4-11112/Ubuntu/Installer/i686/synology-drive-client-11112.i686.deb)
md5sums_i686=('5d0d8f8fc6d0aefa0b1fe707289fb2fc')

source_x86_64=(https://global.download.synology.com/download/Utility/SynologyDriveClient/2.0.4-11112/Ubuntu/Installer/x86_64/synology-drive-client-11112.x86_64.deb)
md5sums_x86_64=('0bff75d3e9a1a6eed8fd4c8351ba4104')

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
