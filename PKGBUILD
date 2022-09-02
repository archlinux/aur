# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=gingerblue
pkgver=6.2.0
pkgrel=1
epoch=
pkgdesc="for musicians who compose, record, and share original music"
arch=("x86_64")
url="https://www.gingerblue.org/"
license=("GPL")
depends=("intltool" "gst-plugins-bad" "libshout" "gtk3" "libchamplain" "geocode-glib" "geoclue")
provides=("gingerblue")
source=("https://www.gingerblue.org/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=("6096f54c60d401cf450e32f85ce72414fd7f4445d35c337cfaae02dfe95ced96")

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
