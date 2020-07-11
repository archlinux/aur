# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=qactus
pkgver=2.0.2
pkgrel=1
pkgdesc='A Qt-based OBS notifier application'
arch=(x86_64)
url='https://github.com/javierllorente/qactus'
license=(GPL2 GPL3)
depends=(desktop-file-utils gtk-update-icon-cache qtkeychain)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/javierllorente/qactus/archive/v$pkgver.tar.gz")
sha256sums=('bc3d953358399253a22d13dcc1d74ada2a3675939a29024c230cd92085eb157b')

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
