# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=ad3
pkgver=2.0.2
pkgrel=1
pkgdesc="Alternating directions dual decomposition approximate MAP decoder"
arch=(x86_64)
url="http://www.ark.cs.cmu.edu/AD3/"
license=('LGPL')
depends=(eigen)
makedepends=()
options=(staticlibs !makeflags)
source=(http://www.cs.cmu.edu/~afm/AD3/AD3-${pkgver}.tar.gz)
md5sums=(57d54349b00888f44a7fd0a3296a2d12)

build() {
	cd "$srcdir/AD3-$pkgver"
	make 
}

package() {
	cd "$srcdir/AD3-$pkgver"
    install -v -Dm755 ad3_multi "$pkgdir/usr/bin/ad3_multi"
    install -v -Dm644 -t "$pkgdir/usr/lib/" ad3/libad3.a 
    install -v -Dm644 -t "$pkgdir/usr/include/ad3" ad3/*.h
}
