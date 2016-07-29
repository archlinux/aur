# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=0.2
pkgrel=1
pkgdesc='A portal frontend service for Flatpak and possibly other desktop containment frameworks.'
arch=('i686' 'x86_64')
url='http://flatpak.org'
license=('LGPL2')
depends=('flatpak')
source=("https://github.com/flatpak/xdg-desktop-portal/releases/download/$pkgver/xdg-desktop-portal-$pkgver.tar.xz")
sha256sums=('4d2172da91c0af5d5ccf946d0694272ed2bff99b53073467def5d8547527b73c')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr --libexec=/usr/lib
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

