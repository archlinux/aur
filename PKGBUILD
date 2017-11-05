# $Id$
# Maintainer: Cédric Bellegarde cedric bellegarde at adishatz dot org

pkgname=eolie
pkgver=0.9.11
pkgrel=2
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk' 'python-pyfxa' 'python-dateutil' 'python-crypto')
makedepends=('gobject-introspection' 'meson' 'webkit2gtk')
source=("https://github.com/gnumdk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('9ccc0c5f5806760fa921e783064d873da6207cbc51bcabfd16ae62a468b54086')

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
