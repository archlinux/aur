# Maintainer: Steef Hegeman <mail@steefhegeman.com>
pkgname=snixembed
pkgver=0.3.2
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
md5sums=('5c03c98f2056f096398b079f9d796ed9')

build() {
	cd snixembed-$pkgver
	make
}

package() {
	cd snixembed-$pkgver
	make DESTDIR="$pkgdir" install
}
