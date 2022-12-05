#This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it 
# Maintainer: Your Name <youremail@domain.com>
pkgname=qmalloc
pkgver=1.1
pkgrel=1
pkgdesc="A simple extended malloc allowing for callbacks to be run if NULL was returned."
arch=('x86_64')
url="https://github.com/charliehogger31/qmalloc"
license=('BSD')
makedepends=('cmake')
source=("https://github.com/charliehogger31/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9e9d835ab1d8103a8e1462f1fe79b073d9ea9b7595b2fdc866a936c1ae67b245')

build() {
	cd "$pkgname-$pkgver"
	cmake .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
