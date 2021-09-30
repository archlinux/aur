# Maintainer: silverhikari
pkgname=gingerblue
pkgver=1.8.0
pkgrel=1
epoch=
pkgdesc="for musicians who compose, record, and share original music"
arch=("x86_64")
url="https://www.gingerblue.org/"
license=("GPL")
depends=("intltool" "gst-plugins-bad" "libshout" "gtk3" "libchamplain" "geocode-glib")
provides=("gingerblue")
source=("https://www.gingerblue.org/src/${pkgname}-${pkgver}.tar.xz")
sha256sums=("2acc6be188feda7e22e0b0ff0ce7f39ac9812a6f8549fe96efe957e939a166c3")

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
