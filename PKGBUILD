# Maintainer: Cian Ormond <aur@cianormond.com>
# Maintainer: Owen Wang <newo@duck.com>

pkgname=vatsim-manager
pkgver=0.1.1
pkgrel=1
pkgdesc="Installer and manager for VATSIM clients"
arch=('x86_64')
url="https://github.com/wiggleforlife/vatsim-mgr"
license=('GPL3')
makedepends=('cmake>=3.16.0'
	     'curl>=7.68.0')
optdepends=('wine: ATC and AFV client support'
	    'winetricks: ATC and AFV client support')

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dbc04d41af28f9547dff801ce81f8d6cdf80cc55193d5591bde5b0c6dcf47240')

build() {
	cd "$srcdir/vatsim-mgr-$pkgver"
	cmake .
	make
}

package() {
	cd "$srcdir/vatsim-mgr-$pkgver"
	install -D vatsim-mgr "$pkgdir/usr/bin/vatsim-mgr"
}
