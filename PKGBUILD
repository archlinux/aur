# Maintainer: Stefan J. Betz <info@stefan-betz.net>
pkgname=subnetcalc
pkgver=2.5.1
pkgrel=1
pkgdesc="Subnet Calculator for IPv4/IPv6"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/dreibh/subnetcalc"
depends=('geoip')
makedepends=('cmake')
source=("https://github.com/dreibh/subnetcalc/archive/refs/tags/subnetcalc-$pkgver.tar.gz")
md5sums=('cb7b7169f42ee352ab9a3a96230743a9')
sha512sums=('b78eb6686865f6337fb736a965f4eba0d7edeb2a8905a52a5d70caee8936b768010b36a65bad1e26ac3cf73af95210d006fd1037a0fe4b2d578b2eaf4c7251a4')

build() {
	cd $srcdir/$pkgname-$pkgname-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr .
	make
}

package() {
	cd $srcdir/$pkgname-$pkgname-$pkgver
	mkdir -p $pkgdir/usr
	make install
}
