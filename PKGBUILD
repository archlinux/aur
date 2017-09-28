# Maintainer: lpr1 (lei.pero@gmail.com)

pkgname=adg-gtk-theme
pkgver=3.22.3
pkgrel=1
pkgdesc="Slight gray modification of Adwaita theme from the GNOME Project."
url="https://github.com/leipero/adg-gtk-theme"
arch=(any)
license=(GPL)
depends=(sassc)
makedepends=(sassc)
options=(!emptydirs)
source=("adg-gtk-theme-$pkgver.tar.gz"::"https://github.com/leipero/adg-gtk-theme/archive/$pkgver.tar.gz")
sha256sums=('3956c7cf438d19245f63f4a03b6a393e070ef95dc826b8e029d2ac1793c5d304')

build() {
	cd "$pkgname-$pkgver"

	./configure
	make
	make install
}

package() {
	cd "$pkgname-$pkgver"
	install -dm755 "$pkgdir/usr/share/themes"

	cp -r "$srcdir"/$pkgname-$pkgver/themes/ "$pkgdir/usr/share"
	make DESTDIR="$pkgdir/"
	make uninstall
	make clean
}
