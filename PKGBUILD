# Maintainer: Gabriel Holmann <gholmann16 at gmail dot com> 
pkgname=janus
pkgver=0.9.4
pkgrel=1
pkgdesc="Simple gtk notepad written in C"
url="https://github.com/gholmann16/janus"
arch=('any')
conflicts=('janus-gateway')
license=('GPL3')
depends=('gtk3' 'gtksourceview4')
source=("https://github.com/gholmann16/janus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7744e227649dd6a8aae29a2ff70becb048d3affb011b3ade74aa378db09acc60')
build() {
	cd "Janus-$pkgver"
	make release
}

package() {
	cd "Janus-$pkgver"
	make install DESTDIR=${pkgdir}
}
