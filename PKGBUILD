# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=etesync-dav-bin
pkgver=0.31.2
pkgrel=2
pkgdesc='A CalDAV and CardDAV adapter for EteSync'
arch=('x86_64')
url='https://github.com/etesync/etesync-dav'
license=('GPL3')
provides=('etesync-dav')
conflicts=('etesync-dav')
source=("${url}/releases/download/v${pkgver}/linux-amd64-etesync-dav"
        "https://raw.githubusercontent.com/etesync/etesync-dav/v${pkgver}/examples/systemd-sandbox/etesync-dav@.service"
        "https://raw.githubusercontent.com/etesync/etesync-dav/v${pkgver}/examples/systemd-user/etesync-dav.service")
b2sums=('505a04e7a15d95d04a38de2dbe4954909134607be01f47ee3db94658a1210b7a9bb3040c995ce11f6f44cc9dc888b86418f824cfb32af9c30f55f188888ee9a0'
        '312589c5276bb06c1918d9b9d4f345112ea344e257cbaf5a38da9fd9cba5295d3d977def858dcb42e1b18b1783abe0e92ac42974136eaf58fdc0831a4d97deac'
        '2a64875a008414065bd2b3e88a989900ad571f00a7f6e95d68ab298ab1905333668ec2fe835494f5f084419e4b64baf23cf566e1f914508f5c8264074e198a67')

package() {
    install -Dm 755 linux-amd64-etesync-dav "${pkgdir}/usr/bin/etesync-dav"

    mkdir -p "${pkgdir}/usr/lib/systemd/user/"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 ../etesync-dav.service "${pkgdir}/usr/lib/systemd/user/"
    install -Dm 644 ../etesync-dav@.service "${pkgdir}/usr/lib/systemd/system/"
}
