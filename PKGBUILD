# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center-bin
pkgver=2.0.1
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
    make service
    make DESTDIR="$pkgdir" install
}

sha256sums=('a07d4fdb1f5fa3ae74d528fbae6e1d67a3ccf051589fc0a2a9b06bae07db9708')
