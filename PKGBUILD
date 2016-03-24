# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-station-backup
pkgver=4203
pkgrel=1
pkgdesc="A backup service that allows you to back up your files from multiple client computers to a centralized Synology NAS"
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('qt5-base')
install=synology-cloud-station-backup.install

source_x86_64=(http://global.download.synology.com/download/Tools/CloudStationBackup/4.0-${pkgver}/Ubuntu/Installer/x86_64/synology-cloud-station-backup-${pkgver}.x86_64.deb)
md5sums_i686=('9cd19a98569873604a84694124eba1b8')
md5sums_x86_64=('2a7ec3ee6c99051c2d917933b8d32095')
source_i686=(http://global.download.synology.com/download/Tools/CloudStationBackup/4.0-${pkgver}/Ubuntu/Installer/i686/synology-cloud-station-backup-${pkgver}.i686.deb)

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    install -Dm755 usr/bin/synology-cloud-station-backup "${pkgdir}/usr/bin/synology-cloud-station-backup"
    install -Dm644 usr/share/applications/synology-cloud-station-backup.desktop "${pkgdir}/usr/share/applications/synology-cloud-station-backup.desktop"
}
