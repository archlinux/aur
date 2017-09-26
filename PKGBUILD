
# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>
pkgname=tapocalc
pkgver=0.2.1
pkgrel=1
pkgdesc="Thanos Apostolou' Calculator"
arch=(i686 x86_64)
url="https://github.com/ThanosApostolou/tapocalc/"
license=('GPL3')
makedepends=(meson)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('86fdbf3801399f7a180106436d2e992c818399d95bd49b54d437a9ae55c6c19c')

build() {
	cd "$pkgname-$pkgver"
	meson --prefix=/usr --buildtype=release builddir
	cd builddir
	ninja
}

package() {
	cd "$pkgname-$pkgver/builddir"
	DESTDIR="$pkgdir" ninja install
} 
