# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=dsweep
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A minesweeper clone for the terminal written in D"
arch=(any)
url="https://github.com/seeseemelk/dsweep"
license=('MIT')
makedepends=(dub d-compiler)
source=("https://github.com/seeseemelk/dsweep/archive/v${pkgver}.tar.gz")
md5sums=('3577f474c3b253ca8948a7a90a5cff40')

build() {
	cd "$pkgname-$pkgver"
	dub build
}

check() {
	cd "$pkgname-$pkgver"
	dub test
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 dsweep "$pkgdir/usr/bin/$pkgname"
}
