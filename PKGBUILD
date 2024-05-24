# Maintainer: Johannes Altmanninger <aclopte@gmail.com>

pkgname=git-autofixup
pkgdesc='A git subcommand to automatically create fixup commits for topic branches'
url='https://github.com/torbiak/git-autofixup'
license=('Artistic2.0')
pkgver=0.004005
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

sha512sums=('769fb6936b5ae82aae66b8ea6228e76a915f1a284f91f57b2cc2d6aaf669393f76822b1c846c44a53151cb9e71d234ef4a75d98557214409ae7aee0d087cc111')

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
