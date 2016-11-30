# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=0.4
pkgrel=1
pkgdesc='A portal frontend service for Flatpak and possibly other desktop containment frameworks.'
arch=('i686' 'x86_64')
url='http://flatpak.org'
license=('LGPL2')
depends=('flatpak')
source=("https://github.com/flatpak/xdg-desktop-portal/releases/download/$pkgver/xdg-desktop-portal-$pkgver.tar.xz")
sha256sums=('41fd8c6b5fbad08afeccfe67e5f472555d13223a1ec880eed90218b33ac595ea')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr --libexec=/usr/lib
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

