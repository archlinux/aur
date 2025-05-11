# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=markable
pkgver=2.0.1
pkgrel=2
pkgdesc='C++ 11 library alternative to boost::optional<T>.'
url="https://github.com/akrzemi1/${pkgname}"
license=('BSL-1.0')
depends=()
makedepends=('cmake')
arch=('any')
sha256sums=('63d245ef4256f78971789cde03746ace01d5c024df9a824ca7de101158467336')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/akrzemi1/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="${pkgname}-${pkgver}"

build() {
	cmake -S "${_srcdir}" -B 'build' -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build 'build'
}

check() {
	cmake --build 'build' --target test
}

package() {
	DESTDIR="${pkgdir}" cmake --install 'build'
}
