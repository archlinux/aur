# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=chromecast-tools-git
pkgver=12.bf20224
pkgrel=1
pkgdesc="A set of simple utilities for working with Chromecast USB boot image files"
arch=('i686' 'x86_64')
url="https://github.com/tchebb/chromecast-tools"
license=('GPL')
depends=()
makedepends=('git')
source=('git+https://github.com/tchebb/chromecast-tools.git')
sha256sums=('SKIP')

pkgver() {
	cd "chromecast-tools"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/chromecast-tools"

	make
}

package() {
	cd "$srcdir/chromecast-tools"

	install -d "$pkgdir/usr/bin/"
	install -t "$pkgdir/usr/bin/" $(ls | grep -ve '.c$')
}
