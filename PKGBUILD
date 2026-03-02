# Maintainer: Johannes Altmanninger <aclopte@gmail.com>

pkgname=git-autofixup
pkgdesc='A git subcommand to automatically create fixup commits for topic branches'
url='https://github.com/torbiak/git-autofixup'
license=('Artistic2.0')
pkgver=0.005000
pkgrel=1
depends=(perl git)
makedepends=(make patch)
optdepends=(
    'git-revise: efficiently apply fixup commits'
)
arch=(any)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/torbiak/git-autofixup/archive/refs/tags/v$pkgver.tar.gz"
)

sha512sums=('a409672715b87566cd14f31bbfd2552d96ae6b31a5746cc797ac621f513d6facd009b16801fe2f4d8e4068ba271d7db1a5323775100da28f51d975d2a1068959')

build() {
	cd "$pkgname-$pkgver"
	perl Makefile.PL
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
