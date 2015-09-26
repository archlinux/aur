# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=libpredict
pkgver=1.0.0
pkgrel=1
pkgdesc="A satellite orbit prediction library"
arch=('i686' 'x86_64')
url="https://github.com/la1k/libpredict"
license=('GPL')
depends=('glibc')
makedepends=('cmake')
optdepends=('flyby')
source=("https://github.com/la1k/libpredict/archive/v${pkgver}.tar.gz")
md5sums=('851f4b1a225f6d8801267464ca932dd7')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
