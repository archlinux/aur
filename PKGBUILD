# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vgrive
pkgver=1.5.0
pkgrel=1
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'libsoup')
makedepends=('meson' 'vala' 'cmake' 'appstream-glib')
optdepends=('libunity' 'libappindicator-gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcedu/VGrive/archive/v$pkgver.tar.gz")
sha256sums=('7d4316d12047c556f53d0d3a05db9a31c5947fd2038f70d234f3bfc748b6755b')

build() {
	arch-meson "VGrive-$pkgver" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	ln -s /usr/bin/com.github.bcedu.vgrive "$pkgdir/usr/bin/$pkgname"
}
