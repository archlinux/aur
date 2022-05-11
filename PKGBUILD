# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2022.04
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('0cddaf8b15520d442b58a6bf3c923f767e4db095a5e14a1390ab8dfc65f637c68131102a5b37b5b73a4a0816087976785d74cad1b4b798a410992418633831c6')

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

