# Maintainer: Loic Blot <https://www.unix-experience.fr>
pkgname=hindsight
pkgver=0.15.0
pkgrel=1
pkgdesc="Hindsight - light weight data processing skeleton"
source=("https://github.com/mozilla-services/hindsight/archive/v$pkgver.tar.gz")
sha256sums=('5887a9404400cc7cc90a4d89b1936789117c935104be4169873b95b291a1f030')
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('cmake')
depends=("libluasandbox>=1.3.0")

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
