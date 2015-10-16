# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=re
pkgver=0.4.13
pkgrel=1
pkgdesc="portable library for real-time communications"
arch=('i686' 'x86_64')
url="http://creytiv.com/re.html"
license=('BSD')
depends=('openssl' 'zlib')
#changelog=ChangeLog
source=("http://creytiv.com/pub/$pkgname-$pkgver.tar.gz"
        "fix_compatibility_with_glibc_2.22.diff")
md5sums=('d5405878ca66c09d5e2e3b4e3d0c4c26'
         '401fc777cd05a931906ab746cde6bda2')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/fix_compatibility_with_glibc_2.22.diff"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
