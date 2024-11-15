# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=bp-nfoview
pkgver=0.4.0
pkgrel=2
pkgdesc="A Simple NFO-Viewer"
arch=('x86_64')
url="https://github.com/brainpower/bp-nfoview"
license=('GPL')
depends=('qt6-base' 'qt6-5compat')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/brainpower/bp-nfoview/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c48dc115dbf71851d05ce2c251aaad5ab249258cbd9f9e225a2d45220a70c68c')

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
