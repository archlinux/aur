# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vgrive
pkgver=1.6.1
pkgrel=1
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'libsoup')
makedepends=('meson' 'vala')
#checkdepends=('appstream')
optdepends=('libunity' 'libappindicator-gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f125ef74ce1d53517cc45d69716bb9668847d5c406096306aedf2a1178b4bfde')

build() {
	arch-meson "VGrive-$pkgver" build
	meson compile -C build
}

#check() {
#	meson test -C build
#}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s /usr/bin/com.github.bcedu.vgrive "$pkgdir/usr/bin/$pkgname"
}
