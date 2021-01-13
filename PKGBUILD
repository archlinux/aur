# Maintainer: Dominic Meiser dosm dot mail at gmail

pkgname=qtwebapp-cmake
pkgver=1.7.11
pkgrel=2
pkgdesc="Fork of QtWebApp using CMake as build system. QtWepApp is a HTTP server library in C++, inspired by Java Servlets."
arch=('x86_64' 'armv7h')
url="https://github.com/msrd0/QtWebApp"
license=('LGPL')
depends=('cmake' 'qt5-base')
makedepends=('git')
source=("https://github.com/msrd0/QtWebApp/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

prepare()
{
	cd "$srcdir/QtWebApp-$pkgver/QtWebApp"
	mkdir -p build
}

build()
{
	cd "$srcdir/QtWebApp-$pkgver/QtWebApp/build"
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package()
{
	cd "$srcdir/QtWebApp-$pkgver/QtWebApp/build"
	make install DESTDIR="$pkgdir"
}
