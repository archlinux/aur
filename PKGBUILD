# Maintainer: Samuel Vincent Creshal <samuel@creshal.de>
pkgname=twemperf
pkgver=0.1.1
pkgrel=1
pkgdesc="Twitter's twemperf/mcperf memcached benchmark tool"
arch=('i686' 'x86_64')
url="https://github.com/twitter/twemperf"
license=('GPL3')
depends=('glibc')
makedepends=()
source=("https://github.com/twitter/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1f1b869fd1df4de4f8011812e5dd73ad')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

