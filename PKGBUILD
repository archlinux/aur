# Maintainer: Midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>
pkgname=gmpc-mdcover
pkgver=0.20.0
pkgrel=1
epoch=
pkgdesc="GMPC plugin that collects metadata from the music's directory"
arch=(i686 x86_64)
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_MDCOVER"
license=('GPL2')
depends=(gmpc)
makedepends=(automake)
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tgz::http://download.sarine.nl/Programs/gmpc/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e0f50943e46ff83614d9d18e08aa2b4e592b71df090763e0827dee8106170d82')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -ivf
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

#  vim: set noet :
