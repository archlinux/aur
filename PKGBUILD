# Maintainer: Jeremy Baxter <jtbx@disroot.org>

pkgname=callisto
pkgver=0.1.0
pkgrel=1
pkgdesc='A featureful runtime for Lua 5.4'
arch=('x86_64')
url='https://jtbx.github.io/callisto'
depends=('readline')
license=('GPL')
options=('!emptydirs')
source=(https://github.com/jtbx/callisto/releases/download/v$pkgver/callisto-$pkgver.tgz)
sha256sums=('825aa7717e21ebe443b0a71a5961c6c144a82e6be09b38d91e494008f5a73f3f')

build() {
	cd callisto-$pkgver
	make
}

package() {
	cd callisto-$pkgver
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
