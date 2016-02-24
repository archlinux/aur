# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

pkgname=populatefs
pkgver=1.0
pkgrel=1
pkgdesc="Tool for replacing genext2fs when creating ext4 images"
arch=(x86_64)
url="https://github.com/lipnitsk/populatefs"
license=('GPL')
depends=('e2fsprogs')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e5845404188b5da3afb11229ecb38646cc1562b61400035774dbc237c3b706d2')

build() {
	cd ${pkgname}-${pkgver}
	make EXTRA_CFLAGS="-fPIC -DHAVE_GETOPT_H=1"
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}/" install
}
