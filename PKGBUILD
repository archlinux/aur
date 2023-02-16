# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Submitter  : Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer : aksr <aksr at t-com dot me>
pkgname=natch
pkgver=3.3
pkgrel=1
pkgdesc='A software solving chess proof games'
arch=('i686' 'x86_64')
url='http://natch.free.fr/Natch.html'
license=('GPL2')
source=("http://natch.free.fr/Natch/Natch-$pkgver.tar.gz")
md5sums=('34427a97c2b23c7077541e030937003c')
sha1sums=('350b45971d0604c3674d7f608e7853329584ead4')
sha256sums=('a30148d508b34ee41b1d3ad91ca89020c8f1fa7bd433cc950b19b004a06d7ef3')
sha512sums=('9ceb2366842467ecc5f4b6fc33c06d096bc067a472a1569a3dae6727ab32b2bb466f2435eb38f5bcd8604f2ca7811e0813f9741194e3ee05f6d7db453750e660')

build() {
	cd "$srcdir/Natch-$pkgver"
	CFLAGS='-march=native -mtune=native'
	./configure
	make
}

package() {
	cd "$srcdir/Natch-$pkgver"
	install -m 755 -D src/Natch "$pkgdir/usr/bin/natch"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -m 644 README* "$pkgdir/usr/share/doc/$pkgname"
}
