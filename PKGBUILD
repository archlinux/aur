# Maintainer: rern <rernrern@gmail.com>

pkgname=python-upnpp
pkgver=1.0.2
pkgrel=1
pkgdesc="Python UPnP control interface based on libupnpp."
url="https://www.lesbonscomptes.com/upmpdcli/libupnpp-python/upnpp-python.html"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(libnpupnp meson-python swig)
sourcename=libupnpp-bindings-libupnpp-bindings-v$pkgver
source=(https://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-bindings-$pkgver.tar.gz)
sha256sums=('6f74627fe217353b65dd322c588e82ccae161844bd5ba03c209df261369646b2')

build() {
	cd $srcdir/libupnpp-bindings-$pkgver
	mkdir -p build
	arch-meson build
	meson compile -C build
}
package() {
	cd $srcdir/libupnpp-bindings-$pkgver
	meson install -C build --destdir $pkgdir
}
