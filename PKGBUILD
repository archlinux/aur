# Maintainer: Johannes Altmanninger <aclopte@gmail.com>

pkgname=git-autofixup
pkgdesc='A git subcommand to automatically create fixup commits for topic branches'
url='https://github.com/torbiak/git-autofixup'
license=('Artistic2.0')
pkgver=0.004003
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

sha512sums=('5d4b9b830ac3a02a427af631a33af15ff6a10098ab26c9bbc0533e2d4f4b8213cf472287f98cf5dae9489ee7958b96a42278473ecd2145c0007f42bd0073dfba')

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
