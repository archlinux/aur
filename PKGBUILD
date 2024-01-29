# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=gingerblue
pkgver=8.0.0
pkgrel=1
epoch=
pkgdesc="for musicians who compose, record, and share original music"
arch=("x86_64")
url="https://www.gingerblue.org/"
license=("GPL")
depends=("intltool" "gst-plugins-bad" "libshout" "gtk3" "libchamplain" "geocode-glib-2" "geoclue" "glib2" "gstreamer" "libxml2" "libvorbis" "hicolor-icon-theme")
provides=("gingerblue")
source=("https://www.gingerblue.org/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=("49d1cbb37e7fbcfb8605503f2dcc0da4fd7ed4cfb33509c7fce659e37132d085")

build() {
	cd "$pkgname-$pkgver"
	autoupdate
	autoreconf
	aclocal
	automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
