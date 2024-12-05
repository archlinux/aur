# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=xmppc
pkgver=0.1.2
pkgrel=2
pkgdesc="Command Line Interface Tool for XMPP"
arch=('x86_64' 'i686')
url="https://codeberg.org/Anoxinon_e.V./xmppc"
license=('GPL-3.0-or-later')
depends=('glibc' 'glib2' 'libstrophe' 'gpgme')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('05259ec5cba25f693edfe01389a3405835404539c7817fb208c201e29480e6b7')

build() {
	cd "$pkgname"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
