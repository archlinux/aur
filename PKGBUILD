# Maintainer: Anton Leontiev <scileont /at/ gmail.com>

pkgname=bgrep
pkgver=1.0
pkgrel=1
pkgdesc='Binary grep'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/rsharo/bgrep'
license=('BSD')
depends=('glibc')
checkdepends=('vim')
source=(https://github.com/rsharo/bgrep/archive/$pkgname-$pkgver.tar.gz)
md5sums=('1d69eb383eea5c6b3e6e5532a0fba37f')

prepare() {
	cd $pkgname-$pkgname-$pkgver
    ./bootstrap
}

build() {
	cd $pkgname-$pkgname-$pkgver
    ./configure --prefix=/usr
	make
}

check() {
	cd $pkgname-$pkgname-$pkgver
	make check
}

package() {
	cd $pkgname-$pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
