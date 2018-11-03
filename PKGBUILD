# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2018.10
pkgrel=1
pkgdesc="Runtime built for the 6model object system."
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('glibc')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
sha512sums=('24af58d9481cf9cf9bd31d098b18c0059aad870a52c0a826fe6296fcd9d23bb44fe343a2aeffc8a0f694db681b6691c3cafc81218d82e988064cd98bf5c8ea5d')

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

