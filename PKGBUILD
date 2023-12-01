# Maintainer: j.r <j.r@jugendhacker.de>
pkgname=xmppc
pkgver=0.1.2
pkgrel=1
pkgdesc="Command Line Interface Tool for XMPP"
arch=('x86_64' 'i686')
url="https://codeberg.org/Anoxinon_e.V./xmppc"
license=('GPL3')
depends=('glibc' 'glib2' 'libstrophe' 'gpgme')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")

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
md5sums=('a0587dc482ed4fb57fe9fae94463c93d')
