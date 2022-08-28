# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-libdc
_pkgname=libdivecomputer-subsurface-branch
pkgver=5.0.9
pkgrel=1
pkgdesc='Library for communication with dive computers'
url='https://github.com/Subsurface-divelog/libdc'
license=('LGPL')
arch=('x86_64')
depends=('glibc')
conflicts=('libdivecomputer.so')
source=("$pkgname-$pkgver.tar.gz::https://subsurface-divelog.org/downloads/$_pkgname-$pkgver.tgz")
sha256sums=('dc64d235cced88d8db44fd9b9debd735caf7cbd199b79fabe61fecb8f64c7905')

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
