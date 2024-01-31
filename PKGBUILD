# Maintainer: Gabriel Holmann <gholmann16 at gmail dot com> 
pkgname=notes-gtk
pkgver=0.9.1
pkgrel=1
pkgdesc="Simple gtk notepad"
url="https://github.com/gholmann16/notes"
arch=('x86_64')
license=('GPL3')
conflicts=('notes')
depends=('gtk3' 'gtksourceview4')
source=("https://github.com/gholmann16/notes/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('434ec6b63c6d5fce2d9adf2c1e772c42bec653f593869b5f758a83035286598c')
build() {
	cd "Notes-$pkgver"
	make release
}

package() {
	install -Dm755 "Notes-${pkgver}/notes" "${pkgdir}/usr/bin/notes"
	install -Dm644 "Notes-${pkgver}/data/notes.png" "${pkgdir}/usr/share/pixmaps/notes.png"
	install -Dm644 "Notes-${pkgver}/data/notes.desktop" "${pkgdir}/usr/share/applications/notes.desktop"
}
