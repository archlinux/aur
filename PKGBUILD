# Maintainer: kirigaya <kirigaya@mkacg.com>
pkgname=deepin-topbar
pkgver=0.1
pkgrel=1
_commit=master
pkgdesc="This is topbar for Deepin."
arch=('i686' 'x86_64')
url="https://github.com/kirigayakazushin/deepin-topbar"
license=('GPL')
groups=()
depends=('xcb-util' 'deepin-tool-kit' 'qt5-base' 'deepin-qt-dbus-factory')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kirigayakazushin/deepin-topbar/archive/$_commit.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

prepare() {
    mv deepin-topbar-{$_commit,$pkgver}
}

build() {
    cd "$pkgname-$pkgver"
    qmake QMAKE_CFLAGS_ISYSTEM= PREFIX=/usr
    make -j4
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="${pkgdir}" install
}
