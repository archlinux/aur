# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center
pkgver=1.7.4
pkgrel=1
pkgdesc="Customizable notification-daemon with notification center"
url="https://github.com/phuhl/linux_notification_center"
license=("BSD")
arch=('x86_64')
depends=('gobject-introspection-runtime' 'gtk3')
makedepends=('stack' 'cairo' 'pango' 'gobject-introspection')
provides=('deadd-notification-center')
conflicts=('deadd-notification-center-bin' 'deadd-notification-center-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phuhl/linux_notification_center/archive/${pkgver}.tar.gz")

prepare() {
    tar -zxvf "${pkgname}-${pkgver}.tar.gz"
}

build() {
    cd "linux_notification_center-${pkgver}"
    make
}

package() {
    cd "linux_notification_center-${pkgver}"
    make DESTDIR="$pkgdir" install
}
sha256sums=('54c767b39514f78470418c12d396f7df611296e9fc5e6706b470deb13861e29f')
