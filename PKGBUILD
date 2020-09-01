# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tardis
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple backup application for elementary OS"
arch=('x86_64')
url="https://github.com/chasinglogic/tardis"
license=('GPL3')
depends=('gtk3' 'granite' 'rsync')
makedepends=('meson' 'vala')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('951d94742b374c733b10ea83ea6a4b2ca5eb4bb6f810d42fa55015c100ee7023')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	ln -s "/usr/bin/com.github.chasinglogic.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
