# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=qactus
pkgver=2.0.1
pkgrel=1
pkgdesc='A Qt-based OBS notifier application'
arch=(x86_64)
url='https://github.com/javierllorente/qactus'
license=(GPL2 GPL3)
depends=(desktop-file-utils gtk-update-icon-cache qtkeychain)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/javierllorente/qactus/archive/v$pkgver.tar.gz")
sha256sums=('d0289ce9099ccdb61187edb4e0e081b012cd5229c37e8ae9480d9d1101f4269a')

build() {
    cd $pkgname-$pkgver
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="${pkgdir}" install
}
