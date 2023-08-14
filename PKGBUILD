# Maintainer: jdigi78 <jdigiovanni78@gmail.com>
# Contributor: Leyorus <leyorusdev@gmail.com>
pkgname=mkvextract-gtk
pkgdesc="Simple Linux GUI to extract tracks from matroska (mkv) files"
url="https://github.com/Joseph-DiGiovanni/mkvextract-gtk/"
license=('GPL2')
arch=('x86_64')
depends=('mkvtoolnix-cli')
makedepends=('gcc' 'pkgconf' 'make' 'cmake' 'boost' 'gtkmm')

# Update following lines for each new release
pkgver=0.9.4
pkgrel=1
git_sha1="4118661"
md5sums=("f33406e5aa081a28e838626ab8260ed9")

source=("https://github.com/Joseph-DiGiovanni/mkvextract-gtk/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	cmake . && make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	mkdir -p "$pkgdir/usr/bin/"
	cp mkvextract-gtk "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin"
}
