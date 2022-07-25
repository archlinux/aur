# Maintainer: Steef Hegeman <mail@steefhegeman.com>
pkgname=snixembed
pkgver=0.3.3
pkgrel=1
pkgdesc="proxy the StatusNotifierItem protocol to the XEmbed System Tray"
url="https://git.sr.ht/~steef/snixembed"
arch=("x86_64")
license=("ISC")
depends=("glib2"
         "gtk3"
         "libdbusmenu-gtk3"
)
makedepends=("vala")
conflicts=("snixembed-git")
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~steef/$pkgname/archive/$pkgver.tar.gz")
md5sums=('aceff2975b478178ad5192909576fa90')

build() {
	cd snixembed-$pkgver
	make
}

package() {
	cd snixembed-$pkgver
	make DESTDIR="$pkgdir" install
}
