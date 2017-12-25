# $Id$
# Maintainer: Cédric Bellegarde cedric bellegarde at adishatz dot org

pkgname=eolie
pkgver=0.9.16
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk' 'python-pyfxa' 'python-dateutil' 'python-crypto')
makedepends=('gobject-introspection' 'meson' 'webkit2gtk')
source=("https://gitlab.gnome.org/gnumdk/eolie/uploads/2d3872b8b4c467740fdcf2cec6a26440/$pkgname-$pkgver.tar.xz")
sha256sums=('4b6c07196308b037ddc7d04e0333aef65415ccdf567f6b301b513acdbc1e67f2')

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
