# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>

pkgname=fget
pkgver=0.4.1
pkgrel=4
pkgdesc="a minimal http/ftp download tool"
url="http://www.fefe.de/fget/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('dietlibc')
source=(http://www.fefe.de/fget/$pkgname-$pkgver.tar.bz2)
md5sums=('03fd6e36853c43b94ce630243f5e5434')

build() {
	cd "$srcdir/$pkgname"
	echo 'diet gcc -Os' > conf-cc
	echo 'diet gcc -s'  > conf-ld
        make fget
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 fget "$pkgdir"/usr/bin/fget
	install -Dm644 fget.1 "$pkgdir"/usr/share/man/man1/fget.1
}
