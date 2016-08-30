# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=ophidia-terminal
pkgver=0.10.5
pkgrel=1
pkgdesc="The Ophidia Terminal is an advanced bash-like interpreter through which it is possible to submit arbitrary requests to an Ophidia Server"
arch=(i686 x86_64)
url="https://github.com/indigo-dc/ophidia-terminal"
license=('GPL')
depends=(jansson graphviz gtk2 libxml2 curl openssl readline libssh2)
source=(https://github.com/indigo-dc/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('6d572c61b5bcc0b4c4429842da2ca301')

prepare() {
	cd "$pkgname-$pkgver"
    ./bootstrap
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
