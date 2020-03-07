# Maintainer:  Dimitris Kiziridis <ragourl at outlook dot com>
# Contributor: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.7.3
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('x86_64')
url="https://scrm.github.io"
license=('GPL3')
makedepends=('gcc>=4.8.1')
source=("https://github.com/scrm/scrm/archive/v${pkgver}.tar.gz")
md5sums=('89c69e32e42fd494690ee938298a916b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	aclocal
	autoconf
	automake -a
	CXX='g++' CXXFLAGS='-O3 -march=native' ./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}