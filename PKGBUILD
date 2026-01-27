# Maintainer: Ben Ruijl <benruyl@gmail.com> 
# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=form
_pkgid=${pkgname}
pkgver=5.0.0
pkgrel=1
pkgdesc="Symbolic Manipulation System developed at Nikhef."
arch=('i686' 'x86_64')
url="https://www.nikhef.nl/~form/"
license=('GPL')
depends=('gmp>=4.2' 'zlib>=1.2')
makedepends=('autoconf' 'automake')  # included in `base-devel`
provides=('tform')
conflicts=('form-git')
source=("https://github.com/vermaseren/form/releases/download/v${pkgver}/form-${pkgver}.tar.gz")
sha256sums=('10d22acf2f0acf831b494e6a73682828980b9054ea8ec2b5dc46677dca8d6518')

build() {
	cd $_pkgid-$pkgver
	autoreconf -i
	./configure --prefix=/usr
	make ${MAKEFLAGS}
}

package() {
	cd $_pkgid-$pkgver
	make DESTDIR="$pkgdir" install
}
