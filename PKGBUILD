# Maintainer: lpr1 (lei.pero@gmail.com)

pkgname=adg-gtk-theme
pkgver=3.22.3
pkgrel=3
pkgdesc="Slight gray modification of Adwaita theme from the GNOME Project."
url="https://github.com/leipero/adg-gtk-theme"
arch=(any)
license=(GPL)
depends=('gtk-engine-murrine')
makedepends=('sassc' 'git' 'libarchive')
optdepends=('optipng' 'inkscape')
options=(!emptydirs)
source=("adg-gtk-theme-$pkgver.tar.gz"::"https://github.com/leipero/adg-gtk-theme/archive/3.22.3.tar.gz")
sha256sums=('db82f9e4dbfba2734b9361cde5924fcedca2584b0d76f80e8bbfb3c2180335ca')

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
