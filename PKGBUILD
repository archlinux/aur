# Maintainer: lxz <lxz@ilxz.me>
pkgname=deepin-dreamscene
pkgver=0.2.3
pkgrel=1
pkgdesc="This is video wallpaper for Deepin."
arch=('i686' 'x86_64')
url="https://github.com/kirigayakazushin/deepin-dreamscene"
license=('GPL')
groups=()
depends=('xcb-util' 'xcb-util-wm' 'qt5-base' 'mpv')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kirigayakazushin/deepin-dreamscene/archive/$pkgver.tar.gz")
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
