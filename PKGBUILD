# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-kiosk
pkgver=50.0
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
         'gnome-session'
         'graphene'
         'gsettings-desktop-schemas'
         'libgcc'
         'libglvnd'
         'libibus'
         'mutter'
         'systemd-libs')
makedepends=('git'
             'glib2-devel'
             'meson')
source=("git+${url}.git#tag=${pkgver}")
b2sums=('ff803c1c531ab11a5262a386850b8256fdbed8cc8eff6ccafa6d5b0efcb4a9f66410d3b97bf891cf139880aec2eef61da9d27ca42536f3fdf3920c87338bd683')

build() {
    arch-meson "${pkgname}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
