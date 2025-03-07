# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=bp-nfoview
pkgver=0.4.2
pkgrel=1
pkgdesc="A Simple NFO-Viewer"
arch=('x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt6-base' 'qt6-5compat')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('62db68569acf6701feafdedd21a3d59a787d61221cf18e5adb23c9d71b9f7213')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -B build -S . \
	  -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=RelWithDebInfo

	ninja -C build
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" ninja -C build install
}
