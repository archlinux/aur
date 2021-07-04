# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2021.06
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('zstd')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
b2sums=('2bf6fc2e1a4dd0741819305e506945b09ed2a0fc1348ff98565cae397e76044176f05e87faeed1f52d5efadccb6d44edcb987553f5e164417153a8f23ba09493')

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

