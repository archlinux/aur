# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=ghostz
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="A homology search tool which can detect remote homologues."
arch=(any)
url="http://www.bi.cs.titech.ac.jp/ghostz/"
license=('custom')
groups=()
depends=()
makedepends=('gcc>4.3')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::http://www.bi.cs.titech.ac.jp/ghostz/releases/ghostz-${pkgver}.tar.gz")
noextract=()
sha256sums=('3e896563ab49ef620babfb7de7022d678dee2413d34b780d295eff8b984b9902')
validpgpkeys=()

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
