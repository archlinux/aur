# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-station-drive
pkgver=4207
_sver=4.0
pkgrel=1
pkgdesc="An application which sync files between your computers and Synology NAS"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/releaseNote/CloudStationDrive"
license=('unknown')
optdepends=('nautilus: For nautilus integration')
install=synology-cloud-station-drive.install

source_x86_64=(https://global.download.synology.com/download/Tools/CloudStationDrive/${_sver}-${pkgver}/Ubuntu/Installer/x86_64/synology-cloud-station-drive-${pkgver}.x86_64.deb)
md5sums_i686=('f3cae6589ad8900b1bb938e3a72f0e47')
md5sums_x86_64=('6c78b42dddd09a008afb03c6b0073177')
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
