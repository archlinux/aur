# Maintainer: Steef Hegeman <mail@steefhegeman.com>
pkgname=snixembed-git
pkgver=0.1.1.r4.g996c95c
pkgrel=1
pkgdesc="proxy StatusNotifierItems as XEmbedded systemtray-spec icons"
arch=("x86_64")
license=("ISC")
depends=("glib2"
         "gtk3"
         "libdbusmenu-gtk3"
)
makedepends=("vala")
source=("git+https://git.sr.ht/~steef/snixembed")
md5sums=("SKIP")

pkgver() {
	cd snixembed
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd snixembed
	make
}

package() {
	cd snixembed
	make DESTDIR="$pkgdir" install
}
