# Maintainer: balaraz <balaraz@tuta.io>

_pkgname=clipp
pkgname="$_pkgname-git"
pkgver=1.2.3_6_g2c32
pkgrel=1
pkgdesc="Modern C++ header only library to parse cmd arguments"
license=(MIT)
url="https://github.com/muellan/clipp"
arch=(any)
makedepends=(git cmake)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
		cd $srcdir/$_pkgname
		git describe --tags --match="v[0-9]*.*" --abbrev=4 | sed 's/-/_/g' | sed 's/^v//'
}

package() {
		cmake -S $_pkgname -Bbuild \
				-DCMAKE_BUILD_TYPE=Release
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr
}
