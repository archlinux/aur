# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-kiosk
pkgver=50.1
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
         'gnome-desktop-4'
         'graphene'
         'libgcc'
         'libglvnd'
         'libibus'
         'mutter'
         'systemd-libs')
makedepends=('git' 'glib2-devel' 'meson')
source=("git+${url}.git#tag=${pkgver}")
b2sums=('2a496defb872a86e0688928031b99e34e101053f0cb1d80749f7a9730d98237db03a7033b0859cc2b912a4154a8f3f97e4ad9353c82b6e86dd130c5cd87e458a')

build() {
    arch-meson "${pkgname}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
