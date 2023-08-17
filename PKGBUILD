# Maintainer: JosephDiGiovanni <jdigiovanni78@gmail.com>
# Contributor: Leyorus <leyorusdev@gmail.com>
pkgname=mkvextract-gtk
pkgdesc="Extract tracks from matroska (mkv) files"
url="https://github.com/Joseph-DiGiovanni/mkvextract-gtk/"
license=('GPL2')
arch=('x86_64')
depends=('mkvtoolnix-cli' 'gtkmm3')
makedepends=('gcc' 'pkgconf' 'make' 'cmake' 'boost' 'gtkmm3')

# Update following lines for each new release
pkgver=0.9.6
pkgrel=1
sha1sums=("e0f8b39ed1ae9d13ad16dd9f87f979bce81f7e9b")

source=("https://github.com/Joseph-DiGiovanni/mkvextract-gtk/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	cmake . && make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	install -Dm755 "mkvextract-gtk" "$pkgdir/usr/bin/mkvextract-gtk"
	install -Dm644 "desktop/mkvextract-gtk.desktop" "$pkgdir/usr/share/applications/mkvextract-gtk.desktop"
	install -Dm644 "desktop/mkvextract-gtk.desktop" "$pkgdir/usr/share/applications/mkvextract-gtk.desktop"
	install -Dm644 "desktop/mkvextract-gtk.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/mkvextract-gtk.png"
}
