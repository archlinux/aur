# Maintainer: Ivy Foster <code@escondida.tk>

pkgname=fist
pkgver=4.0
pkgrel=1
pkgdesc='Emphatic message generator'
arch=(i686 x86_64)
url='https://www.fourmilab.ch/fist/'
license=('custom:PublicDomain')
source=("https://www.fourmilab.ch/fist/fist-$pkgver.tar.gz")
# checksums not provided by upstream
md5sums=(f59c4b52a04e1d13b077510cf66589e9)

build() {
	cd "fist-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "fist-$pkgver"
	install -d "$pkgdir"/usr/{bin,share/man/man1}
	make DESTDIR="$pkgdir" install
	install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/fist/COPYING
}
