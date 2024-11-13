# Maintainer: Johannes Altmanninger <aclopte@gmail.com>

pkgname=git-autofixup
pkgdesc='A git subcommand to automatically create fixup commits for topic branches'
url='https://github.com/torbiak/git-autofixup'
license=('Artistic2.0')
pkgver=0.004007
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

sha512sums=('19807c323b315040f3dbead5cba88db93580f6a10280710854b4bf8999d2fed15a3568324bff653a9fe22e65267a9b19a08b713241f6c83240e9a22350f80811')

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
