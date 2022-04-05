# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-libdc
_pkgname=libdivecomputer-subsurface-branch
pkgver=5.0.8
pkgrel=1
pkgdesc='Library for communication with dive computers'
url='https://github.com/Subsurface-divelog/libdc'
license=('LGPL')
arch=('x86_64')
depends=('glibc')
conflicts=('libdivecomputer.so')
source=("$pkgname-$pkgver.tar.gz::https://subsurface-divelog.org/downloads/$_pkgname-$pkgver.tgz")
sha256sums=('f6953421148d36dc7e1ca95981bc9873894e0ab51f87ac332fd62322e77c76f2')

prepare() {
	cd "$_pkgname-$pkgver"
	autoreconf --install
}

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
