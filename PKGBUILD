# $Id$
# Maintainer: Cédric Bellegarde cedric bellegarde at adishatz dot org

pkgname=eolie
pkgver=0.9.12
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk' 'python-pyfxa' 'python-dateutil' 'python-crypto')
makedepends=('gobject-introspection' 'meson' 'webkit2gtk')
source=("https://github.com/gnumdk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('dfd2551e3b24212586b9bedc0e7fb93446b521ffa8966d00e77e0ba43feb8ae2')

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
