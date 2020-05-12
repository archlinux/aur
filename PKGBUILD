# Maintainer: Anes Belfodil <anes dot belfodil at gmail dot com>

pkgname=wraith-master-bin
pkgver=1.0.0
pkgrel=0
pkgdesc="Wraith Master"
arch=('x86_64')
license=("Apache-2.0")
depends=('gtk3')
source=("wraith-master.tar.xz::https://gitlab.com/serebit/wraith-master/uploads/4c06c92e48c3b1a6df93dd817adc97e4/wraith-master-1.0.0.tar.xz")
sha256sums=('SKIP')
url="https://gitlab.com/serebit/wraith-master"

package(){
    cd ${srcdir}/wraith-master

    install -d ${pkgdir}/usr/bin
    install -Dm755 wraith-master wraith-master-gtk ${pkgdir}/usr/bin

    install -d ${pkgdir}/etc/udev/rules.d
    install -Dm644 resources/99-wraith-master.rules ${pkgdir}/etc/udev/rules.d

    install -d ${pkgdir}/usr/share/applications
    install -Dm644 resources/wraith-master.desktop ${pkgdir}/usr/share/applications

    install -d ${pkgdir}/usr/share/pixmaps
    install -Dm644 resources/wraith-master.svg ${pkgdir}/usr/share/pixmaps
}
