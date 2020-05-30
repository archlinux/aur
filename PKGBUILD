# Maintainer: X0rg
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
# Contributor: Mildred <silkensedai@online.fr>
# Contributor: Pierre-Olivier Vauboin <povauboin at gmail dot com>

pkgname=libaosd
pkgver=0.2.7
pkgrel=2
pkgdesc="Atheme On Screen Display library"
arch=('i686' 'x86_64')
url="https://github.com/atheme/libaosd"
license=('MIT')
depends=('libxcomposite' 'pango')
source=("$pkgname-$pkgver.tar.gz::https://github.com/atheme/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ebe60b992b0315026c024db83c788ed9c829f1400e0c6da51caeb17d58649825fafb14d7f73cc80a82866f53f108a1e18f921109f940cb59fce038a12f214329')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
