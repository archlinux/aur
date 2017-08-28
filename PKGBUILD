# Maintainer: Andi Shyti <andi.shyti@samsung.com>
# Jaehoon You <jaehoon.you@samsung.com>
# Karol Lewandowski <k.lewandowsk@samsung.com>
# Rafal Krypa <r.krypa@samsung.com>
# Piotr Wilczek <p.wilczek@samsung.com>
# Krzysztof Opasiak <k.opasiak@samsung.com>

_pkgname=lthor
pkgname=$_pkgname-git
pkgver=2.0
pkgrel=1
pkgdesk="Samsung phone flasher"
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
