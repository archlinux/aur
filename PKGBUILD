# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Yujia Qiao <rapiz3142@gmail.com>
pkgname=btcdeb
pkgver=0.3.20
pkgrel=1
pkgdesc="Bitcoin Script Debugger"
arch=(x86_64)
url="https://github.com/bitcoin-core/btcdeb"
license=('MIT')
makedepends=(automake)
source=("https://github.com/bitcoin-core/btcdeb/archive/refs/tags/$pkgver.tar.gz")
md5sums=('b2724041b93dfe24e434b6bd8038e9dd')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
