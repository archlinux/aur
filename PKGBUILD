# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: uastasi <uastasi at archlinux dot us>
#
pkgname="frogr"
pkgver="1.5"
pkgrel="1"
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
source=("${pkgname}-${pkgver}.tar.xz::http://download.gnome.org/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('874fab2cde9c56519c1675af377d5bd95b21fb7db686723b50da47e8f01907b1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
