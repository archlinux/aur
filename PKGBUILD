# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=sonic-qt-accounts-library
pkgdesc='Qt-based client library for accessing the online accounts database'
pkgver=1.17.2
pkgrel=1
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-qt-accounts-library'
license=('LGPL-2.1-only')
depends=(
	'glib2'
	'glibc'
	'libaccounts-glib'
	'libgcc'
	'libstdc++'
	'qt6-base'
)
makedepends=('cmake')
provides=('libaccounts-qt')
conflicts=('libaccounts-qt')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6ab0a000dd494f52593f8233bba0643035ffbcacbd99c71947f20fe655f0ba55')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
