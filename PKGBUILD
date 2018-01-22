# $Id$
# Maintainer: Cédric Bellegarde cedric bellegarde at adishatz dot org

pkgname=eolie
pkgver=0.9.18
pkgrel=1
pkgdesc="Simple web browser for GNOME"
arch=('x86_64' 'i686')
url="https://gnumdk.github.io/eolie-web/"
license=('GPL3')
depends=('gtkspell3' 'python-beautifulsoup4' 'python-cairo' 'python-gobject' 'webkit2gtk' 'python-pyfxa' 'python-dateutil' 'python-crypto')
makedepends=('gobject-introspection' 'meson' 'webkit2gtk')
source=("https://gitlab.gnome.org/gnumdk/eolie/uploads/9cd3ea9fbedfdfdacca141fa009b200c/eolie-0.9.18.tar.xz")
sha256sums=('c28a38631db25d400a7bbbc0c901d78c4e92e29667c22105a3cec4479dff3eeb')

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
