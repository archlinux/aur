# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tardis
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple backup application for elementary OS"
arch=('x86_64')
url="https://github.com/chasinglogic/tardis"
license=('GPL3')
depends=('gtk3' 'granite' 'rsync')
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e15ff03e4092be5454e2899ea7138b83ed5993bcbdd0bd605916978f612e6509')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s "/usr/bin/com.github.chasinglogic.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
