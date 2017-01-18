# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal-gtk
pkgver=0.5
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal that is using GTK+ and various pieces of GNOME infrastructure.'
arch=('i686' 'x86_64')
url='http://flatpak.org'
license=('LGPL2')
depends=('xdg-desktop-portal' 'gtk3')
source=("https://github.com/flatpak/xdg-desktop-portal-gtk/releases/download/$pkgver/xdg-desktop-portal-gtk-$pkgver.tar.xz")
sha256sums=('790744654f361203c5578fd04d7576b1c5fa2cad9cdd2f595672dd07415c4591')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr --libexec=/usr/lib
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

