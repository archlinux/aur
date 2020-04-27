# Maintainer: Steef Hegeman <mail@steefhegeman.com>
pkgname=snixembed-git
pkgver=0.2.1.r0.g767f1b0
pkgrel=1
pkgdesc="proxy StatusNotifierItems as XEmbedded systemtray-spec icons"
url="https://git.sr.ht/~steef/snixembed"
arch=("x86_64")
license=("ISC")
depends=("glib2"
         "gtk3"
         "libdbusmenu-gtk3"
)
makedepends=("git"
             "vala"
)
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
