# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: uastasi <uastasi at archlinux dot us>

pkgname=frogr
pkgver=1.8.1
pkgrel=1
pkgdesc="A flickr remote organizer for GNOME"
url="https://wiki.gnome.org/Apps/Frogr"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gstreamer'
         'gtk3'
         'hicolor-icon-theme'
         'json-glib'
         'libexif'
         'libgcrypt'
         'libsoup3'
         'libxml2')
makedepends=('itstool' 'meson')
source=("http://download.gnome.org/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('046dd28bfd741a4b89e4e2c39da4f66370a76ab2e8225da4ddf26ca4c2fb6066')

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}

# vim:set ts=4 sw=4 et:
