# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imeditor
pkgver=0.9.4
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=('any')
url="https://imeditor.github.io"
license=('GPL3')
depends=('gtk3' 'python-pillow')
makedepends=('meson' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ImEditor/ImEditor/archive/$pkgver.tar.gz")
sha256sums=('82105705461431e1592399b59f1417b53e441d68d1de76b2a6b57ca7efcf0aa6')

build() {
	arch-meson "ImEditor-$pkgver" _build
	ninja -C _build
}

package() {
	DESTDIR="$pkgdir" ninja -C _build install
}
