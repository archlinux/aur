# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=qactus
pkgver=1.0.1
pkgrel=1
pkgdesc='A Qt-based OBS notifier application'
arch=(x86_64)
url='https://github.com/javierllorente/qactus'
license=(GPL2 GPL3)
depends=(desktop-file-utils gtk-update-icon-cache qtkeychain)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/javierllorente/qactus/archive/v$pkgver.tar.gz")
sha256sums=('6ad205715f377bb95c3b01f141eef588b0f5a939030478df4be4d2912c8673a4')

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
