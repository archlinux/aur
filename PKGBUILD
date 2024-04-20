# Maintainer: Gabriel Holmann <gholmann16 at gmail dot com>
pkgname=janus
pkgver=0.9.5
pkgrel=1
pkgdesc="Simple gtk notepad written in C"
url="https://github.com/gholmann16/janus"
arch=('any')
conflicts=('janus-gateway')
license=('GPL3')
depends=('gtk3' 'gtksourceview4')
source=("https://github.com/gholmann16/janus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('294f078754b76d5ca57303e6760234c983d117be05914a396a905f180e9acb3c')
build() {
	cd "Janus-$pkgver"
	make release
}

package() {
	cd "Janus-$pkgver"
	make install DESTDIR=${pkgdir}
}
