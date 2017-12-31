# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=cloudstation-drive
pkgver="4.2.5"
pkgrel="4396"
pkgdesc="Cloud Station Drive is an application designed to synchronize files between your Synology NAS and PCs via the Internet, ensuring that your data is always up-to-date and enabling you to easily access your files."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta', 'cloudstation-3.0')
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Tools/CloudStationDrive/4.2.5-4396/Ubuntu/Installer/i686/synology-cloud-station-drive-4396.i686.deb)
md5sums_i686=('514e3c0721d0f4a160a91f46ebf30921')

source_x86_64=(https://global.download.synology.com/download/Tools/CloudStationDrive/4.2.5-4396/Ubuntu/Installer/x86_64/synology-cloud-station-drive-4396.x86_64.deb)
md5sums_x86_64=('4894cdc3c2009e6d27a0dd7c7d1bc25c')

prepare() {
	cd "$srcdir"
	mkdir control data
	ar x synology-cloud-station-drive-*
	tar xf data.tar.gz --directory data
}

package() {
	cp -r "$srcdir/data/opt" "$pkgdir/opt"
	cp -r "$srcdir/data/usr" "$pkgdir/usr"
}