# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=xmppc
pkgver=0.0.5
pkgrel=2
pkgdesc="Command Line Interface Tool for XMPP"
arch=('x86_64' 'i686')
url="https://codeberg.org/Anoxinon_e.V./xmppc"
license=('GPL3')
depends=('glibc' 'glib2' 'libstrophe' 'gpgme')
makedepends=()
source=("${url}/archive/$pkgver.tar.gz")

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
md5sums=('eb950cd55a63508285fdb9bc840458b1')
