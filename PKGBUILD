# Maintainer: kirigaya <kirigaya@mkacg.com>
pkgname=deepin-topbar
pkgver=0.4.4
pkgrel=1
pkgdesc="This is topbar for Deepin."
arch=('i686' 'x86_64')
url="https://github.com/kirigayakazushin/deepin-topbar"
license=('GPL')
groups=()
depends=('xcb-util' 'dtkwidget' 'dtkwm' 'qt5-base' 'deepin-qt-dbus-factory')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kirigayakazushin/deepin-topbar/archive/$pkgver.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

build() {
    cd "$pkgname-$pkgver"
    qmake QMAKE_CFLAGS_ISYSTEM= PREFIX=/usr
    make -j4
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="${pkgdir}" install
}
