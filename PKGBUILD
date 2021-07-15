# Maintainer: silverhikari
pkgname=gingerblue
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="for musicians who compose, record, and share original music"
arch=("x86_64")
url="https://www.gingerblue.org/"
license=("GPL")
depends=("intltool" "gst-plugins-bad" "libshout" "gtk3")
makedepends=("libchamplain" "geocode-glib")
provides=("gingerblue")
source=("https://www.gingerblue.org/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=("6ca6ea29d0ecae86981e9749e2a969143275f68ab676b21ebcd75ffd8248ce44")

build() {
	cd "$pkgname-$pkgver"
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
