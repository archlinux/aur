# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2019.11
pkgrel=1
pkgdesc="Runtime built for the 6model object system."
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('glibc')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
sha512sums=('d7d7d21ff0e3896b7cb869ea1298f9ff1b041b68062ac509d4571246f96985de0ad48d881f7c988e1ed470c4c5f859f36916bfd764cbc0e988c249682b0b8b41')

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

