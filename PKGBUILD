# Maintainer: Evert Mouw <post@evert.net>
# Contributor: Evert Mouw <post@evert.net>

pkgname=xgrep
pkgver=0.08
pkgrel=1
pkgdesc="grep-like utility for XML files"
url="http://wohlberg.net/public/software/xml/xgrep/"
provides=("xgrep")
makedepends=("makedepend")
depends=("libxml2" "pcre")
conflicts=('xgrep')
arch=('i686' 'x86_64')
license=('GPL')
source=("http://wohlberg.net/public/software/xml/xgrep/xgrep-$pkgver.tar.gz")
md5sums=('cc71e1a40a40b0cadd0fd85deb9de78b')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix="/usr"
	make depend
	make
}

check() {
	test -f "$pkgname-$pkgver/xgrep"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
