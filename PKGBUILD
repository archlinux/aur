# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=nxdumpclient
pkgver=1.1.3
pkgrel=1
pkgdesc="Client program for dumping over USB with nxdumptool"
arch=('x86_64' 'aarch64')
url="https://github.com/v1993/nxdumpclient"
license=('GPL3')
groups=()
depends=('glib2' 'gtk4' 'libadwaita' 'libgusb')
makedepends=('meson' 'vala' 'blueprint-compiler')
source=('https://github.com/v1993/nxdumpclient/archive/refs/tags/v1.1.3.tar.gz')
sha256sums=('514c5a6eccedb8673bb9be7dd81d22952b34e04b607146210e65a366abc8d08b')

build() {
	arch-meson -Dlibportal=disabled "$srcdir/${pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
