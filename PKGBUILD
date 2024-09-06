# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2024.08
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=(0e37a13fbb7fe4ef0959b64615b99d94721873d7257e7a26dd49013523a3956e83e12a33468560155b37446b859c0d77f87f1cb816de469d9916b1c4e57f3af5)

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

