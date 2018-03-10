# Maintainer: Laurens Hazewinkel <laurens dot hazewinkel at gmail dot com>
pkgname=mod-host
pkgver=0.10.6
pkgrel=1
pkgdesc="LV2 host for Jack controllable via socket or command line"
arch=('x86_64')
url="https://github.com/moddevices/mod-host"
license=('GPL3')
depends=('lilv>=0.14.2')
source=("https://github.com/moddevices/mod-host/archive/v0.10.6.tar.gz"
	"mod-host.patch")
sha256sums=('58833f09cc3f1d632bcf288778e6eb48328c4cadf2027612ea4dc9a7748ecbb6'
            '9ab75f98304567a0adcc644b9f0ebf308ade7c617485164682d62297bd7dd8f8')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/mod-host.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
