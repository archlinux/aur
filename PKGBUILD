# Maintainer: aksr <aksr at t-com dot me>
# Contributor: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=libmawk
pkgver=1.0.5
pkgrel=1
pkgdesc='A fork of mawk 1.3.3, restructured for embedding.'
url='http://www.repo.hu/projects/libmawk/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
source=("$url/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('18db04b5931968f5cb9864e0009578a57ef449e8f2997bedbc829ce55f2dc2b1')

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make DESTDIR="$pkgdir/" install
}
