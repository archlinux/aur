# Maintainer: Takayuki Tanaka <aharotias2@gmail.com.org>

pkgname=parapara
pkgver=3.2.8
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
sha256sums=('653595dd4f0f8a1140080efcbca20116ec89e544076b0cd589e55c7d3134877b')

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
