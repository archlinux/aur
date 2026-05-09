_commit=3f57ee0b9ae6e5750402714634103c7df3c7d4a4

pkgname=wsmancli
pkgver=2.6.2
pkgrel=2
pkgdesc="Command line client utilities for WS-Management"
arch=('i686' 'x86_64')
url="https://github.com/Openwsman/$pkgname"
license=('custom:BSD')
depends=('openwsman>=2.5')
source=("$url/archive/$_commit.zip")
sha256sums=('df06976759e92a5033e0d0f4495a5bde9d86b9d85b2ae934486ab592b51741f3')

build() {
	cd "$pkgname-$_commit"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$_commit"
	make DESTDIR="$pkgdir/" install

	install -Dp -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh ts=4 sw=4 noet:
