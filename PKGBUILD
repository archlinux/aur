# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=nxdumpclient
pkgver=1.1.4
pkgrel=1
pkgdesc="Client program for dumping over USB with nxdumptool"
arch=('x86_64' 'aarch64')
url="https://github.com/v1993/nxdumpclient"
license=('GPL3')
groups=()
depends=('glib2' 'gtk4' 'libadwaita' 'libgusb')
makedepends=('meson' 'vala' 'blueprint-compiler')
source=('https://github.com/v1993/nxdumpclient/archive/refs/tags/v1.1.4.tar.gz')
sha256sums=('114b1b303063611bfbba247f03c5d93e2f4cc9f03711a693b1ccb5509b0b66c1')

build() {
	arch-meson -Dlibportal=disabled "$srcdir/${pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
