# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-recursive
pkgver=1.0.1
pkgrel=1
pkgdesc="A recursive structural transfer module for Apertium"
arch=('i686' 'x86_64')
url="https://wiki.apertium.org/wiki/Apertium-recursive"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc')
depends=('lttoolbox>=3.5.3' 'apertium>=3.7.0' 'libxml2' 'pcre')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3fef8b1a1919f805880d57d86343b3fab4735ab21efa8d111fb07578c81894ea')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
