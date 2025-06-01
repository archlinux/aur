# Maintainer: Gurkirat Singh <tbhaxor@gmail.com>

pkgname=libfirefly
pkgver='3.1.0'
pkgrel=2
pkgdesc='A standalone C++ Library for vectors calculations'
arch=(any)
url='https://github.com/tbhaxor/firefly'
license=('GPL-3.0-only')
makedepends=('cmake' 'make')
conflicts=('libfirefly2')
source=("https://github.com/tbhaxor/firefly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e64b1c20da5fde56431a2aa5603323408a98349ea1e9aa76825032bcc0f2ce7')

build() {
	cmake -S "firefly-${pkgver}" -Bbuild -Wno-deprecated -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make -C build
}

package() {
	make -C build install
}
