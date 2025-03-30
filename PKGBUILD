# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2025.03
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('db5064f5feb4efa8ab5e5e1bbde05a84c3129c5cbeac17f22c3171cf5e0411e7398f6391b45eb00cc0851f30d5f4891df6852a4bfcd86ab1889a251e4f92b0a8')

build() {
	cd $_pkgname-${pkgver}0

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-${pkgver}0
	make DESTDIR="$pkgdir/" install
}

