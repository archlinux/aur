# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=libpredict
pkgver=2.0.0
pkgrel=3
pkgdesc="A satellite orbit prediction library"
arch=('i686' 'x86_64')
url="https://github.com/la1k/libpredict"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/la1k/libpredict/archive/v${pkgver}.tar.gz")
md5sums=('b93c7a2f2f18fbe1c5edf487bc89e097')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
