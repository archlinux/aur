# Maintainer: Andi Shyti <andi.shyti@samsung.com>

_pkgname=lthor
pkgname=$_pkgname-git
pkgver=2.0
pkgrel=1
pkgdesc="Tizen target flasher"
arch=('i686' 'x86_64')
url="https://www.tizen.org/"
license=('APL')
depends=('cmake')
makedpends=('git')
group=('tizen-tools')
source=('git://git.tizen.org/tools/lthor')
sha256sums=('SKIP')

build() {
	cd $_pkgname
	mkdir build
	cd build
	cmake ../
	make
}

package() {
	cd $_pkgname/build

	make DESTDIR=$pkgdir install
}
