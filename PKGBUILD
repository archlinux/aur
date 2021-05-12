# Maintainer: dingjing <dingjing[at]live[dot]cn>
# Cloud Server
_server=cpx51
pkgbase=svclient
pkgname=('svclient')
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/dingjingmaster/svclient"
license=('MIT')
pkgdesc="kylin software VPN"
depends=(
    'qt5-base'
)
makedepends=(
    'git'
    'qt5-base'
)
source=(
    "https://github.com/dingjingmaster/svclient/archive/${pkgver}.tar.gz"
)
sha256sums=(
    "e60ec8df710696a0fd48aa531b19521385083d5beb7f153138523c1303379deb"
)

prepare() {
    msg "prepare"
}

build() {
    msg "build"
}
package_svclient() {
    msg "${pkgname} package"
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/usr/lib/"
    install -dm755 "${pkgdir}/usr/share/"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/etc/systemd/system/"

    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/sslvpn            "${pkgdir}/usr/share/svclient/sslvpn"
    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/svclient          "${pkgdir}/usr/share/svclient/svclient"
    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/SVClient.png      "${pkgdir}/usr/share/svclient/SVClient.png"
    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/SVClient_linux    "${pkgdir}/usr/share/svclient/SVClient_linux"

    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/svmgrsh           "${pkgdir}/usr/share/svclient/svmgrash"
    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/svmgrsvc          "${pkgdir}/usr/share/svclient/svmgrsvc"
    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/svmonitor         "${pkgdir}/usr/share/svclient/svmonitor"
    install -Dm655 ${srcdir}/svclient-1.3.0/vpn/svclient/svmonitorsh       "${pkgdir}/usr/share/svclient/svmonitorsh"

    install -Dm755 ${srcdir}/svclient-1.3.0/vpn/usr-lib/*                  "${pkgdir}/usr/lib/"
    install -Dm755 ${srcdir}/svclient-1.3.0/vpn/usr-share-applications/*   "${pkgdir}/usr/share/applications/"

    install -Dm755 ${srcdir}/svclient-1.3.0/vpn/etc-systemd-system/*       "${pkgdir}/etc/systemd/system/"

    install -Dm644 ../../README.md                  "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 ../../LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
