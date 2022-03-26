# Maintainer: Takayuki Tanaka <aharotias2@gmail.com.org>

pkgname=parapara
pkgver=3.2.9
pkgrel=1
pkgdesc='A picture viewer that has 3 display modes: single, spread, continuous.'
url='https://github.com/aharotias2/parapara'
license=('GPLv3')
arch=('x86_64')
depends=('gtk3' 'granite' 'libgee')
makedepends=('vala' 'meson')
optdepends=()
install=.INSTALL
source=("https://github.com/aharotias2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a8f523068977455f6ac7aa1ed9d880282fc6e97a7c4ef1e0a63c95679d6f3e37')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson --prefix=/usr --buildtype=release --optimization=2 build
	cd build
	ninja
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	meson install --destdir ${pkgdir}
}
