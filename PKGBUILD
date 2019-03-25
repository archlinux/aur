# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=synology-drive
pkgver="1.1.4"
pkgrel="10580"
pkgdesc="Drive for PC, the desktop utility of the DSM add-on package, Drive, allows you to sync and share files owned by you or shared by others between a centralized Synology NAS and multiple client computers."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive')
source=()
md5sums=()

source_i686=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.4-10580/Ubuntu/Installer/i686/synology-drive-10580.i686.deb)
md5sums_i686=('ad22b8493996472258ddc7baf48733cc')

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyDriveClient/1.1.4-10580/Ubuntu/Installer/x86_64/synology-drive-10580.x86_64.deb)
md5sums_x86_64=('fc6385aacb651f0646b9c1b508629a00')

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