pkgname=lci
pkgver=0.6
pkgrel=1
pkgdesc='A lambda calculus interpreter'
arch=(i686 x86_64)
url='https://chatziko.github.io/lci/'
source=("https://github.com/chatziko/lci/releases/download/v$pkgver/lci-$pkgver.tar.gz")
sha512sums=('97ba25c39cf7d5156091b57bf839eb71c6f05b1ad343d382ec99ff43443d5df91b1ad641a853526dda8724e61059998adbf5bb43a724b93d59409443ecd41877')
license=(GPL)
depends=(readline)

build() {
	cd "$srcdir/lci-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/lci-$pkgver"
	make install DESTDIR="$pkgdir"
}
