# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=gingerblue
pkgver=4.0.1
pkgrel=1
epoch=
pkgdesc="for musicians who compose, record, and share original music"
arch=("x86_64")
url="https://www.gingerblue.org/"
license=("GPL")
depends=("intltool" "gst-plugins-bad" "libshout" "gtk3" "libchamplain" "geocode-glib" "geoclue")
provides=("gingerblue")
source=("https://www.gingerblue.org/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=("dd63cd1442fd9b8c0c6b31a9c9dc68d9a992a72c0642b0d7942889d8eb280f27")

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
