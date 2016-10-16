# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2016.10
pkgrel=1
pkgdesc="Runtime built for the 6model object system."
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('glibc')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
sha512sums=('f8bd5ee1cd8206642408fde92b6f042c18f1ed6513fa52062d1882414ae58c2a601eafcc405f4e82d7d56d7a3d26dd13df2292ab77d26a92880b73334f139157')

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

