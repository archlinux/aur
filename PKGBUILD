# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center
pkgver=2.1.1
pkgrel=0
pkgdesc="Customizable notification-daemon with notification center"
url="https://github.com/phuhl/linux_notification_center"
license=("BSD")
arch=('x86_64')
depends=('gobject-introspection-runtime' 'gtk3')
makedepends=('stack' 'cairo' 'pango' 'gobject-introspection')
provides=('deadd-notification-center')
conflicts=('deadd-notification-center-bin' 'deadd-notification-center-git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/phuhl/linux_notification_center/tar.gz/refs/tags/${pkgver}")

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

sha256sums=('e83cae52aff076da8f199d64580e921eeab029aca6214937ab38a6c43145862b')
