# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-recursive
pkgver=1.2.2
pkgrel=1
pkgdesc="A recursive structural transfer module for Apertium"
arch=('any')
url="https://wiki.apertium.org/wiki/Apertium-recursive"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc' 'utf8cpp')
depends=('lttoolbox>=3.7.0' 'apertium>=3.8.2' 'libxml2>=2.6.17' 'pcre' 'icu')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd1490f2c3940f68b6495ef4b00ca7a0d1735673a8bb2c9caba599935057f25e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
