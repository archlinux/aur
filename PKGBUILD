# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imeditor
pkgver=0.9.6
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=('any')
url="https://imeditor.github.io"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-pillow')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ImEditor/ImEditor/archive/$pkgver.tar.gz")
sha256sums=('b5e980b1153d0aa127b74a75de844b65b463c4e3e8b3071e14792f3f43b414d3')

build() {
	arch-meson ImEditor-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
