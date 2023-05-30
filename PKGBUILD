# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center
pkgver=2.0.3
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

sha256sums=('e6acfad059103dc895e088011a794e6a9545b3ace292c7a19725d9cd67c55842')
