# Maintainer:
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>

pkgname=dtach
pkgver=0.9
pkgrel=3
pkgdesc="emulates the detach feature of screen"
arch=("x86_64")
url="http://dtach.sourceforge.net/"
license=("GPL")
depends=("glibc")
source=(https://downloads.sourceforge.net/sourceforge/dtach/$pkgname-$pkgver.tar.gz)
md5sums=('6dac9c0f96d7d55ea56c01504b23faf6')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 dtach "$pkgdir/usr/bin/dtach"
	install -Dm644 dtach.1 "$pkgdir/usr/share/man/man1/dtach.1"
}
