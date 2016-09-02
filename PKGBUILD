# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=0.3
pkgrel=1
pkgdesc='A portal frontend service for Flatpak and possibly other desktop containment frameworks.'
arch=('i686' 'x86_64')
url='http://flatpak.org'
license=('LGPL2')
depends=('flatpak')
source=("https://github.com/flatpak/xdg-desktop-portal/releases/download/$pkgver/xdg-desktop-portal-$pkgver.tar.xz")
sha256sums=('9521a6f41a5735127bf0596a3a0c9bebc2acb0ebd204787c4ebd5b0575b8bd8d')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr --libexec=/usr/lib
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

