# $Id$
# Maintainer: Cédric Bellegarde cedric bellegarde at adishatz dot org

pkgname=eolie
pkgver=0.9.9
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk' 'python-pyfxa' 'python-dateutil')
makedepends=('gobject-introspection' 'meson' 'webkit2gtk')
source=("https://github.com/gnumdk/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('28c9422563d673ac226edbb7e99c5be4db914a19f33884858069c23fdeec4ca4')

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
