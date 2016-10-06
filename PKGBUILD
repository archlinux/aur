# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: uastasi <uastasi at archlinux dot us>

pkgname=frogr
pkgver=1.2
pkgrel=1
pkgdesc="A flickr remote organizer for GNOME"
url="https://wiki.gnome.org/Apps/Frogr"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'libexif' 'hicolor-icon-theme' 'json-glib' 'desktop-file-utils' 'libsoup' 'gstreamer')
makedepends=('gnome-common' 'intltool' 'yelp-tools')
optdepends=('gst-libav: To support common video formats like .3gp and .MP4 ')
conflicts=("${pkgname}-git")
provides=("${pkgname}")
source=("http://download.gnome.org/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6cd491f2a723201bac3cb9f68e015c534d561b75c4a4b32b2e1b37477d2e82f8')

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
