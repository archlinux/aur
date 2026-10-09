# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-kiosk
pkgver=51.0
pkgrel=1
pkgdesc="Provides a desktop enviroment suitable for fixed purpose, or single application deployments like wall displays and point-of-sale systems"
arch=('x86_64')
url='https://gitlab.gnome.org/GNOME/gnome-kiosk'
license=('GPL-2.0-or-later')
depends=('bash'
         'cairo'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'glycin'
         'gnome-desktop-4'
         'graphene'
         'libgcc'
         'libglvnd'
         'libibus'
         'mutter'
         'systemd-libs')
makedepends=('git' 'glib2-devel' 'meson')
source=("git+${url}.git#tag=${pkgver}")
b2sums=('27504577e7fd7424e91f01f7cb692a16cb9883291b41d96ff33e81c379be8f4bc2a2586273efbce4a481d07ddf0e8457e3317cca5c6d96a10965b4ddd2e218cd')

build() {
    arch-meson "${pkgname}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
