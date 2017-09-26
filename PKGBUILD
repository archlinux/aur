
# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>
pkgname=tapocalc
pkgver=0.2
pkgrel=1
pkgdesc="Thanos Apostolou' Calculator"
arch=(i686 x86_64)
url="https://github.com/ThanosApostolou/tapocalc/"
license=('GPL3')
makedepends=(meson)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('31625ed0b6cf6ac32152b9b82de869c930b1bfa388ae9453754ab10e76f890c5')

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
