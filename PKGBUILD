# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal-gtk
pkgver=0.3
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal that is using GTK+ and various pieces of GNOME infrastructure.'
arch=('i686' 'x86_64')
url='http://flatpak.org'
license=('LGPL2')
depends=('xdg-desktop-portal' 'gtk3')
source=("https://github.com/flatpak/xdg-desktop-portal-gtk/releases/download/$pkgver/xdg-desktop-portal-gtk-$pkgver.tar.xz")
sha256sums=('64a42861b85101ba9a8cd8ea07aec6951c91d12df0735aa44c9bfdf40c989fee')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr --libexec=/usr/lib
    make -s
}

package() {
    cd "$pkgname-$pkgver"

    DESTDIR="$pkgdir" make install
}

