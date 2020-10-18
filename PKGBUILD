# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="Customizable notification-daemon with notification center"
url="https://github.com/phuhl/linux_notification_center"
license=("BSD")
arch=('x86_64')
depends=('gobject-introspection-runtime' 'gtk3')
provides=('deadd-notification-center')
conflicts=('deadd-notification-center' 'deadd-notification-center-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phuhl/linux_notification_center/archive/${pkgver}.tar.gz")

prepare() {
    tar -zxvf "${pkgname}-${pkgver}.tar.gz"
}

build() {
    cd "linux_notification_center-${pkgver}"
}

package() {
    cd "linux_notification_center-${pkgver}"
    make DESTDIR="$pkgdir" install
}

md5sums=('bb2d4739a65c3c7bed3d655d231351bf')
