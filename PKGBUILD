# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Konstantinos Pachnis <kpachnis@mes-direct.com>

pkgname=cmake
pkgver=2.6.2
pkgrel=2
pkgdesc="CMake is a cross-platform open-source make system"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.cmake.org"
depends=('libidn' 'openssl' 'qt')
source=("http://www.cmake.org/files/v2.6/$pkgname-$pkgver.tar.gz")
md5sums=('9e82aa3beb991aa8e5797cf330618d42')

build() {
	cd $srcdir/$pkgname-$pkgver
	./bootstrap --prefix=/usr \
		--mandir=/share/man --docdir=/share/doc/cmake \
		--qt-gui
	make || return 1
	make DESTDIR=$pkgdir install

	install -Dm644 Copyright.txt $pkgdir/usr/share/licenses/$pkgname/Copyright.txt
}
