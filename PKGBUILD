# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=gtksourceview2
pkgver=2.10.5
pkgrel=1
pkgdesc="A text widget that extends the standard gtk+ 2.x"
arch=(x86_64)
url="https://download.gnome.org/sources/gtksourceview"
license=(GNU)
depends=('gtk2' 'libxml2' 'python3')
makedepends=('intltool')
checkdepends=()
provides=()
source=("$url/2.10/gtksourceview-$pkgver.tar.gz")
md5sums=(220db5518e3f7fa06c980f057b22ba62)

build() {
	cd "gtksourceview-$pkgver/"
	./configure --prefix=/usr
	make
}

package() {
	cd "gtksourceview-$pkgver"
	make DESTDIR="$pkgdir/" install
}
