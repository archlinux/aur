# Maintainer: m00n <lmarianski@protonmail.com>
# Contributor: artoo <artoo@artixlinux.org>

pkgname=lvm2-openrc
pkgver=20210106
pkgrel=1
pkgdesc="OpenRC lvm2 init script"
arch=('any')
license=('GPL2')
provides=('init-lvm2')
depends=('device-mapper-openrc' 'lvm2')
conflicts=('init-lvm2')
backup=('etc/conf.d/lvm')
source=("lvm.confd"
        "lvm.initd"
        "lvm-monitoring.initd"
        "lvmetad.initd"
        "lvmpolld.initd")
#         "lvmlockd.initd"
sha256sums=('70318500ade549f6587033ed18e89f35d77478d812765629783fbb47e82e209b'
            'd5fa0d21ff28cf50198699c1049470fef00ed725e8f8744341f184e095bd27d5'
            '46604a5e759883de2758af947390e2a3af81b8977733540185a55484628f13b7'
            'fc01a258e01d2fdb64aade25816aca3ba95acf228410894916200aa491f531a9'
            'c2ecb427721be25e42386b73f278da08944c40676acb3fe7124bc2239a5f7651')

package() {
    install -Dm755 "${srcdir}"/lvm.confd "${pkgdir}"/etc/openrc/conf.d/lvm

    for f in lvm lvm-monitoring lvmetad lvmpolld; do
        install -Dm755 "${srcdir}"/"$f".initd "${pkgdir}"/etc/openrc/init.d/"$f"
    done
}


