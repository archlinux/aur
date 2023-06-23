
# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
# Contributor: Asuka Minato
pkgname=ghostz
pkgver=1.0.2
pkgrel=2
pkgdesc="A homology search tool which can detect remote homologues."
arch=(any)
url="http://www.bi.cs.titech.ac.jp/ghostz/"
license=('BSD')
depends=(gcc-libs glibc)
makedepends=('gcc>4.3')
source=("$pkgname-$pkgver.tar.gz::http://www.bi.cs.titech.ac.jp/ghostz/releases/ghostz-${pkgver}.tar.gz")
sha256sums=('3e896563ab49ef620babfb7de7022d678dee2413d34b780d295eff8b984b9902')

build() {
	pushd "$pkgname-$pkgver"
	make
}

package() {
	pushd "$pkgname-$pkgver"
	install -Dm755 ghostz -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/
}
