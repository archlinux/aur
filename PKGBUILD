# maintainer: dialuplama <dialuplama@teknik.io>
# co-maintainer: muhas <muhas@mail.ru>

pkgname=dsh
pkgver=0.25.10
pkgrel=1
pkgdesc="Distributed shell (or dancer’s shell) executes command remotely on several different machines at the same time."
arch=('any')
url="http://www.netfort.gr.jp/~dancer/software/dsh.html"
license=('GPL2')
depends=('libdshconfig')
source=("https://www.netfort.gr.jp/~dancer/software/downloads/$pkgname-$pkgver.tar.gz")        
md5sums=('5269b26348cc1cc6252317c6dca5d219')

build() {
	cd "$pkgname-$pkgver"
	./configure \
        --prefix=/usr \
        --sysconfdir='/etc/$pkgname'
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
