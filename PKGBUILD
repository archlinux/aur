# Maintainer: Pedro Martinez-Julia <pedromj@gmail.com>
# Contributor: Andreas Wagner <andreas dot wagner at em dot uni-frankfurt dot de>
# Contributor: Dag Odenhall <dag.odenhall-gmail.com>
# Contributor: Giorgio Lando <patroclo7-gmail.com>
pkgname=lsx
pkgver=0.1
pkgrel=12
pkgdesc="List executables"
license=(MIT)
arch=('i686' 'x86_64')
url=http://tools.suckless.org/lsx
depends=(glibc)
source=(http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz)
md5sums=('d48fdce9868b13bf5ef3e7834768f89f')

build() {
	cd $srcdir/$pkgname-$pkgver
	sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk
	make clean
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make clean PREFIX=/usr DESTDIR=$pkgdir install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
