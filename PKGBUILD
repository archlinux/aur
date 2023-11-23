# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=nxdumpclient
pkgver=1.1.2
pkgrel=1
pkgdesc="Client program for dumping over USB with nxdumptool"
arch=('x86_64' 'aarch64')
url="https://github.com/v1993/nxdumpclient"
license=('GPL3')
groups=()
depends=('glib2' 'gtk4' 'libadwaita' 'libgusb')
makedepends=('meson' 'vala' 'blueprint-compiler')
source=('https://github.com/v1993/nxdumpclient/archive/refs/tags/v1.1.2.tar.gz')
sha256sums=('e74ea77bd88958d210f1a6b18425071c27ba13a36f54c64919aaa61a81c0e302')

build() {
	arch-meson -Denforce_build_order=true -Dlibportal=disabled "$srcdir/${pkgname}-${pkgver}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
