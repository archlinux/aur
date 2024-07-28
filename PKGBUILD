# Maintainer: Gabriel Holmann <gholmann16 at gmail dot com>
pkgname=janus
pkgver=0.9.6
pkgrel=1
pkgdesc="Simple gtk notepad written in C"
url="https://github.com/gholmann16/janus"
arch=('any')
conflicts=('janus-gateway')
license=('GPL3')
depends=('gtk3' 'gtksourceview4')
source=("https://github.com/gholmann16/janus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13badbe9c3fddb6c96881e7e755521f0ffcbd60eee62fec5c540a2221134ced5')
build() {
	cd "Janus-$pkgver"
	make release
}

package() {
	cd "Janus-$pkgver"
	make install DESTDIR=${pkgdir}
}
