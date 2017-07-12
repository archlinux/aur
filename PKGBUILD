# Maintainer: Marius Nestor <marius at softpedia dot com>

pkgname=gnome-directory-thumbnailer
pkgver=0.1.9
pkgrel=1
pkgdesc="GNOME thumbnailer to generate thumbnails for directories"
arch=('x86_64' 'i686')
url="https://wiki.gnome.org/GnomeDirectoryThumbnailer"
license=('LGPL2.1')
depends=('gnome-desktop')
makedepends=('intltool')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('f1e7bf8b70833e9601532468b8d80254e0bc43909b6e6860e819ff239161a6e4')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
