# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=0.5
pkgrel=1
pkgdesc='A portal frontend service for Flatpak and possibly other desktop containment frameworks.'
arch=('i686' 'x86_64')
url='http://flatpak.org'
license=('LGPL2')
depends=('flatpak')
source=("https://github.com/flatpak/xdg-desktop-portal/releases/download/$pkgver/xdg-desktop-portal-$pkgver.tar.xz")
sha256sums=('9f4aa2b4bf6b348f0e46d968c92995e7c6f762b831d1b74cc83b5ff5b5836c1f')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr --libexec=/usr/lib
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

