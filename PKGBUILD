# Contributor: Timo Teräs <timo.teras@iki.fi>
# Maintainer: fosdd <fossdd@pwned.life>
pkgname=fortify-headers
pkgver=1.1
pkgrel=1
pkgdesc="standalone fortify source implementation"
url="http://git.2f30.org/fortify-headers/"
arch=("any")
license=("0BSD")
source=("http://dl.2f30.org/releases/fortify-headers-$pkgver.tar.gz"
	"0001-add-initial-clang-support.patch"
	"0002-avoid-__extension__-with-clang.patch"
	"0003-Disable-wrapping-of-ppoll.patch"
)

prepare() {
	patch -p1 --directory="$srcdir/$pkgname-$pkgver" -i "$srcdir/0001-add-initial-clang-support.patch"
	patch -p1 --directory="$srcdir/$pkgname-$pkgver" -i "$srcdir/0002-avoid-__extension__-with-clang.patch"
	patch -p1 --directory="$srcdir/$pkgname-$pkgver" -i "$srcdir/0003-Disable-wrapping-of-ppoll.patch"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}

sha256sums=('6ba5d860a2d2ba4c3346924b93930c34856eafe148bdbdf271ecab8065201fb6'
            '41b0e73131959af228928c3a96403e9831c53033fc07494b63cc3d72252118a5'
            '2e8a14f08e6d77b7ec7d78c16a16b0bd96e147bafd1d35a54fba866cf13cf336'
            '356e3a8f090a4bfd21bc2ed615a7ad6c0c90c5ffd82e7c8457e63c1bda5ac82c')
