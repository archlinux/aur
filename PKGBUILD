# Maintainer: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=btparse
pkgver=0.34
pkgrel=2
pkgdesc="C library for parsing and processing BibTeX data files"
arch=('any')
url="http://www.gerg.ca/software/btOOL/"
license=('GPL2')
depends=()
source=(http://www.gerg.ca/software/btOOL/$pkgname-$pkgver.tar.gz)
md5sums=('87d09ce6331c57cc2da30b5c83f545e0')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

