# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=gingerblue
pkgver=6.0.1
pkgrel=1
epoch=
pkgdesc="for musicians who compose, record, and share original music"
arch=("x86_64")
url="https://www.gingerblue.org/"
license=("GPL")
depends=("intltool" "gst-plugins-bad" "libshout" "gtk3" "libchamplain" "geocode-glib" "geoclue")
provides=("gingerblue")
source=("https://www.gingerblue.org/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=("074de41b083a4ea757d7cc48ff48cac2c2c318f600408262a185f2b222ba4931")

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
