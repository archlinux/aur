# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=lola1
_pkgname=lola
pkgver=1.18
pkgrel=1
pkgdesc="A Low Level Petri Net Analyzer"
arch=('i686' 'x86_64')
url="http://service-technology.org/lola/"
license=('AGPL3')
provides=()
conflicts=()
options=()
install=lola1.install
source=(https://web.archive.org/web/20170226224235/http://download.gna.org/service-tech/lola/lola-1.18.tar.gz)
sha256sums=('33c8ebfb1ddcee0e661370622ea8c1d9c7188f8c8bd09e6ee7c0dea5329c227f')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$_pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
