# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2015.09
pkgrel=1
pkgdesc="Runtime built for the 6model object system."
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('glibc')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
sha512sums=('4ea6f1328d273a18748791d79623df420017792bfa02ba6dbddd8db1d322ee75ebccd0c29a9215a83e36c65422c12865b705a38eb5749c45cf52d53911257c5c')

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

