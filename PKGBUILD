# Maintainer: Connor Behan <connor.behan@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=gtkglarea
pkgver=2.1.0
pkgrel=4
pkgdesc="GTK/GL Area libraries"
arch=('x86_64')
url="https://mono-project.com/GtkGLArea"
license=('GPL')
depends=('gtk2' 'glu')
source=("https://ftp.gnome.org/pub/GNOME/sources/$pkgname/2.1/$pkgname-$pkgver.tar.xz")
sha512sums=('c790c1b542d85d86cd57f333c87ab2c930c8065d6f75320d588688b9a0adb8c4270522b6b88734720db1b71170f4f12c95e650e9a599a5d7e4b7baadf1f9f06b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

