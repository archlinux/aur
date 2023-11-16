# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-xml
_project=gawkextlib
pkgver=1.1.1
pkgrel=4
pkgdesc="GAWK extension - interface to Expat for parsing XML"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('bash' 'expat' 'gawkextlib' 'glibc')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('612ac1eb9745a8da4d37afae769a5ad4')
sha256sums=('319c03c13f2e23fb399bfbc3de24d140bfc42fce51227212700c1755d41296e4')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-silent-rules
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
