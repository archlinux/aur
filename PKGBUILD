# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center
pkgver=2.0.4
pkgrel=0
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
sha256sums=('81913079122d9c2057b75ca5284620bdb0f29e043e1fbf33273127a8aeb85b86')
