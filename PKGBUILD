# Maintainer: Ben Ruijl <benruyl@gmail.com> 
# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=form
_pkgid=${pkgname}
pkgver=4.3.1
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
sha256sums=('f1f512dc34fe9bbd6b19f2dfef05fcb9912dfb43c8368a75b796ec472ee8bbce')

build(){
	cd $_pkgid-$pkgver
	autoreconf -i
	./configure --prefix=/usr
	make ${MAKEFLAGS}
}

package() {
	cd $_pkgid-$pkgver
	make DESTDIR="$pkgdir" install
}
