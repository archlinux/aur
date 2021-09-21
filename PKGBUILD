# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=btop
pkgver=1.0.4
pkgrel=1
pkgdesc='A monitor of system resourecs, bpytop ported to C++'
arch=(x86_64)
url="https://github.com/aristocratos/$pkgname"
license=(apache)
depends=(gcc-libs)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3ac10fc408705322f5e1ae51c2a5bb57bd3749fa64f8afe690162929934be60a')

build() {
	cd "$_archive"
	make all
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
