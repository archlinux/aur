# Maintainer: Loic Blot <https://www.unix-experience.fr>
pkgname=hindsight
pkgver=0.14.2
pkgrel=1
pkgdesc="Hindsight - light weight data processing skeleton"
source=("https://github.com/mozilla-services/hindsight/archive/v$pkgver.tar.gz")
sha256sums=('439d0e7b6adcc74ef50d73e31daa5bb802bbeacd0770daada32f0a5af00f15c0')
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('cmake')
depends=("libluasandbox")

_buildroot="release"
build() {
	cd hindsight-$pkgver
	mkdir $_buildroot
	cd $_buildroot
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DLUASANDBOX_LIB_DIR=/usr/lib ..
	make
}

package() {
	cd hindsight-${pkgver}/${_buildroot}
	make install
}
