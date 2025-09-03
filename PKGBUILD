# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2025.08
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('7e2085431123df0d6097684f45c5a73e6bbb51f3e02656a24b418e6262ba2eaefb97491fff135f90b1dabe336045ba079dc2138e0d8bdaa17b16621158972f1c')

build() {
	cd $_pkgname-${pkgver}

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-${pkgver}
	make DESTDIR="$pkgdir/" install
}

