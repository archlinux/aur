# Submitter: Kuan-Yen Chou <forendef2846@gmail.com>

pkgname=onos
pkgver=1.12.0
pkgrel=2
pkgdesc='Open Network Operating System'
arch=('x86_64')
url='https://onosproject.org/'
license=('Apache')
depends=('jre8-openjdk' 'curl')
install=${pkgname}.install
source=("http://repo1.maven.org/maven2/org/onosproject/onos-releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "onos.service")
sha256sums=('9032950fa077ecebfe2f908ab2efb37be1ce666d251cd76f464514f3c8d03177'
            'c727d17a9c0fe9b3c31a9759f91212e48545d43062cc11c34fe4214242fee6c8')

package() {
    mkdir -p "$pkgdir"/opt
    cp -r "$srcdir"/${pkgname}-${pkgver} "$pkgdir"/opt/${pkgname}
    install -Dm 644 "$srcdir"/onos.service -t "${pkgdir}/usr/lib/systemd/system"
}

# vim: set ts=4 sw=4 et:
