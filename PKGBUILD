# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=vgrive
pkgver=1.4.0
pkgrel=2
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'json-glib' 'libsoup')
makedepends=('meson' 'vala' 'cmake')
optdepends=('libunity' 'libappindicator-gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcedu/VGrive/archive/$pkgver.tar.gz")
sha256sums=('7630e1e706fb0932c0ebf1e2a7b8c051914a1ec3ea970d8b5c19b5b39a93e82a')

build() {
	cd "VGrive-$pkgver"
	arch-meson build
	ninja -C build
}

package() {
	cd "VGrive-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	ln -s /usr/bin/com.github.bcedu.vgrive "$pkgdir/usr/bin/$pkgname"
}
