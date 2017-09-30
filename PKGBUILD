# Maintainer: lpr1 (lei.pero@gmail.com)

pkgname=adg-gtk-theme
pkgver=3.22.3
pkgrel=2
pkgdesc="Slight gray modification of Adwaita theme from the GNOME Project."
url="https://github.com/leipero/adg-gtk-theme"
arch=(any)
license=(GPL)
depends=('gtk-engine-murrine')
makedepends=('sassc' 'git' 'libarchive')
optdepends=('optipng' 'inkscape')
options=(!emptydirs)
source=("adg-gtk-theme-$pkgver.tar.gz"::"https://github.com/leipero/adg-gtk-theme/archive/3.22.3.tar.gz")
sha256sums=('bd39c9c4a411de5f639af1ee1956f751b54d1935d1ea7dff56a08d1db2f0d8b8')

build() {
	cd "$pkgname-$pkgver"

	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -dm755 "$pkgdir/usr/share"

	cp -r "$srcdir"/$pkgname-$pkgver/build-aux/themes "$pkgdir/usr/share"
	make DESTDIR="$pkgdir/"
	make clean
}
