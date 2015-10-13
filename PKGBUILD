# Maintainer: Roman Saveljev <roman.saveljev@haltian.com>
pkgname=kconfig-frontends
pkgver=3.12.0.0
pkgrel=1
pkgdesc='Out of the Linux source tree, packaging of the kconfig infrastructure, ready for use by third party projects'
arch=('x86_64' 'i686')
url="http://ymorin.is-a-geek.org/projects/kconfig-frontends"
license=('GPL')
depends=('ncurses')
makedepends=('gperf')
source=("http://ymorin.is-a-geek.org/download/kconfig-frontends/$pkgname-$pkgver.tar.xz")
noextract=()
md5sums=('b939280dcc83f8feabd87a1d5f9b00c2')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-frontends=mconf,conf,nconf
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
