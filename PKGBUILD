# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-regtest
pkgver=0.9.1
pkgrel=1
pkgdesc="Regression testing system for Apertium"
arch=('any')
url="https://wiki.apertium.org/wiki/Apertium-regtest"
license=('GPL3')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06bdbbc6be60252fa7f05a86bb467f42f369fde9ea6c26ff9e66751fe22242b9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
