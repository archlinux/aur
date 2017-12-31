# Maintainer: Felipe Martin <me@fmartingr.com>

pkgname=cloudstation-backup
pkgver="4.2.5"
pkgrel="4396"
pkgdesc="Cloud Station Backup is a backup service that allows you to back up your files from multiple client computers to a centralized Synology NAS."
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('glibc' 'libsm' 'binutils' 'fontconfig')
optdepends=('nautilus: For nautilus integration')

source_i686=(https://global.download.synology.com/download/Tools/CloudStationBackup/4.2.5-4396/Ubuntu/Installer/i686/synology-cloud-station-backup-4396.i686.deb)
md5sums_i686=('ecaddb940f56a4ebb5a1bb04001b7658')

source_x86_64=(https://global.download.synology.com/download/Tools/CloudStationBackup/4.2.5-4396/Ubuntu/Installer/x86_64/synology-cloud-station-backup-4396.x86_64.deb)
md5sums_x86_64=('ecc6806a1234730d69ae061fc7be8004')

prepare() {
	cd "$srcdir"
	mkdir control data
	ar x synology-cloud-station-backup-*
	tar xf data.tar.gz --directory data
}

package() {
	cp -r "$srcdir/data/opt" "$pkgdir/opt"
	cp -r "$srcdir/data/usr" "$pkgdir/usr"
}