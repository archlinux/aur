# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=qactus
pkgver=2.0.3
pkgrel=1
pkgdesc='A Qt-based OBS notifier application'
arch=(x86_64)
url='https://github.com/javierllorente/qactus'
license=(GPL2 GPL3)
depends=(desktop-file-utils gtk-update-icon-cache qtkeychain)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/javierllorente/qactus/archive/v$pkgver.tar.gz")
sha256sums=('b7e1759d95c6280f57dc324fc8322b602b5eb6fb0cf120f00b955fb72ebb6ff3')

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
