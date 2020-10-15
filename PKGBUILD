# maintainer: dialuplama <dialuplama@teknik.io>
# co-maintainer: muhas <muhas@mail.ru>

pkgname=libdshconfig
pkgver=0.20.13
pkgrel=2
pkgdesc="Library for parsing dsh-style configuration files. Required by dsh and other applications."
arch=('any')
url="https://www.netfort.gr.jp/~dancer/software/dsh.html"
license=('GPL2')
depends=('glibc')
source=("https://www.netfort.gr.jp/~dancer/software/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('cb9db850231091a3a848e654d9f0806b')

build() {
	cd "$pkgname-$pkgver"
	./configure \
        --prefix=/usr \
        --libdir=/usr/lib
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
