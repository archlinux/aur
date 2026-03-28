# Maintainer: aurrrrrr <no email>

# somewhat lazily created, the dependencies might need some more checking

_pkgname=liger
pkgname=crystal-liger
pkgver=0.1.2
pkgrel=1
pkgdesc="Comprehensive, cross-platform Crystal Lang LSP implementation"
arch=(x86_64)
url="https://github.com/navid-m/liger"
license=('GPL-3.0-only')
depends=() # anything missing here?
makedepends=(shards)
#checkdepends=(ameba)
source=("$_pkgname-$pkgver.tar.gz"::https://github.com/navid-m/liger/archive/v${pkgver}.tar.gz)
b2sums=('b786a7a3782528ad89fcf48d112fd3bdbcb8b14afe31990264c813a68a4ac4b5e343d9c27d3eea04fcccec405e6c1e3397cbde34dda55807ef427e0bff0ffeac')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	# copied from the crystalline PKGBUILD
	shards build liger --release --no-debug --progress
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 bin/liger -t "$pkgdir/usr/bin/"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/crystal-liger/"
}

