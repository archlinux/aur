# Maintainer: Aaron Paden <aaronbpaden@gmail.com>
pkgname=oosbuild
pkgver=2.0
pkgrel=1
pkgdesc="Build an autoconf project out of source"
arch=(any)
url="https://github.com/BPaden/oosbuild"
license=('GPL2')
depends=('python' 'python-docopt')
source=("https://github.com/BPaden/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f6eceabc7b6fb5837ea12f75a962d34241f69dab854b368418bc511eee7457f0')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
