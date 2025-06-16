# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2025.05
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('b9983bbe517595925e370d69ad3b71ebc509f659d9838ac9292adb60272c811d3bc85552b4e4cfa615ddf2346e4efc2e296159b461a8f73e21a6f3e4aff96cd1')

build() {
	cd $_pkgname-${pkgver}

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-${pkgver}
	make DESTDIR="$pkgdir/" install
}

