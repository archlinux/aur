# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: uastasi <uastasi at archlinux dot us>

pkgname="frogr"
pkgver=1.4
pkgrel=1
pkgdesc="A flickr remote organizer for GNOME"
url="https://wiki.gnome.org/Apps/Frogr"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'libexif' 'hicolor-icon-theme' 'json-glib' \
		 'desktop-file-utils' 'libsoup' 'gstreamer'
)
makedepends=('gnome-common' 'intltool' 'meson' 'yelp-tools')
optdepends=('gst-libav: To support common video formats like .3gp and .MP4 ')
conflicts=("${pkgname}-git")
provides=("${pkgname}")
source=("http://download.gnome.org/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ace4c9e60364fa5e183384a3e25a0c4ee77c77c59f4bb33f8980ba57317ae68e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et
