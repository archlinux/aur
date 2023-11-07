# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=nxdumpclient
pkgver=1.1.1
pkgrel=0
pkgdesc="Client program for dumping over USB with nxdumptool"
arch=('x86_64' 'aarch64')
url="https://github.com/v1993/nxdumpclient"
license=('GPL3')
groups=()
depends=('glib2' 'gtk4' 'libadwaita' 'libgusb')
makedepends=('meson' 'vala' 'blueprint-compiler')
source=('https://github.com/v1993/nxdumpclient/archive/refs/tags/v1.1.1.tar.gz')
sha256sums=('062f9a443637bed6568e1eaee0a48968df15f13487ea6c50fb874dc8d5b8bdf4')

build() {
	arch-meson -Denforce_build_order=true -Dlibportal=disabled "$srcdir/${pkgname}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
