# $Id$
# Maintainer: Cédric Bellegarde cedric bellegarde at adishatz dot org

pkgname=eolie
pkgver=0.9.15
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk' 'python-pyfxa' 'python-dateutil' 'python-crypto')
makedepends=('gobject-introspection' 'meson' 'webkit2gtk')
source=("https://github.com/gnumdk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('4d0e2386ce166d2a2ff071e832f75ead636371ac8986d9a27b05c11e6e6f9e3e')

prepare() {
	mkdir build
}

build() {
	cd build
	meson --prefix=/usr --libexecdir=/usr/lib/$pkgname --buildtype=release ../$pkgname-$pkgver
	ninja
}

package() {
	cd build
	DESTDIR="$pkgdir" ninja install
}
