# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vgrive
pkgver=1.6.0
pkgrel=1
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'libsoup')
makedepends=('meson' 'vala' 'cmake' 'appstream-glib')
optdepends=('libunity' 'libappindicator-gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f5f6ca93d8122549789faf1e6016277f0d36d5df5c2cf138448e2c0f1dd26eac')

build() {
	arch-meson "VGrive-$pkgver" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install

	ln -s /usr/bin/com.github.bcedu.vgrive "$pkgdir/usr/bin/$pkgname"
}
