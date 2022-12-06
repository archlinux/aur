# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=etesync-dav-bin
pkgver=0.31.2
pkgrel=1
pkgdesc='A CalDAV and CardDAV adapter for EteSync'
arch=('x86_64')
url='https://github.com/etesync/etesync-dav'
license=('GPL3')
provides=('etesync-dav')
conflicts=('etesync-dav')
source=("${url}/releases/download/v${pkgver}/linux-amd64-etesync-dav")
b2sums=('505a04e7a15d95d04a38de2dbe4954909134607be01f47ee3db94658a1210b7a9bb3040c995ce11f6f44cc9dc888b86418f824cfb32af9c30f55f188888ee9a0')

package() {
    install -Dm 755 linux-amd64-etesync-dav "${pkgdir}/usr/bin/etesync-dav"

    mkdir -p "${pkgdir}/usr/lib/systemd/user/"
    install -Dm 644 ../etesync-dav.service "${pkgdir}/usr/lib/systemd/user/"
}
