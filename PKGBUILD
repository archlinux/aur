# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-station-drive
pkgver=4222
_sver=4.1
pkgrel=1
pkgdesc="An application which sync files between your computers and Synology NAS"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/releaseNote/CloudStationDrive"
license=('unknown')
optdepends=('nautilus: For nautilus integration')
install=synology-cloud-station-drive.install

source_x86_64=(https://global.download.synology.com/download/Tools/CloudStationDrive/${_sver}-${pkgver}/Ubuntu/Installer/x86_64/synology-cloud-station-drive-${pkgver}.x86_64.deb)
md5sums_i686=('2cfc46d4880fe4b352400e158a7e3e3c')
md5sums_x86_64=('0a407e037a68aaf0e8326802bbf143ec')
source_i686=(https://global.download.synology.com/download/Tools/CloudStationDrive/${_sver}-${pkgver}/Ubuntu/Installer/i686/synology-cloud-station-drive-${pkgver}.i686.deb)


prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "${pkgdir}/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so"
    install -Dm755 usr/bin/synology-cloud-station-drive "${pkgdir}/usr/bin/synology-cloud-station-drive"
    install -Dm644 usr/share/applications/synology-cloud-station-drive.desktop "${pkgdir}/usr/share/applications/synology-cloud-station-drive.desktop"
}
