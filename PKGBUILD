# Maintainer: dummyx <dummyxa at gmail dot com>

pkgname=vvenc
pkgver=1.7.0
pkgrel=1
pkgdesc="Fraunhofer Versatile Video Encoder (VVenC)"
arch=('x86_64')
url='https://github.com/fraunhoferhhi/vvenc'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake>=3.12' 'gcc>=7')
provides=('vvenc')
conflicts=('vvenc-git')
source=("vvenc-${pkgver}.tar.gz::https://github.com/fraunhoferhhi/vvenc/archive/v${pkgver}.tar.gz")
sha256sums=('cb73d0ebe1d86f2365f47db4f0982d1239748786c18580e2995361559eb5453c')

build() {
	cd "${srcdir}/vvenc-${pkgver}"
	make install-release-shared
}

package() {
	cd "${srcdir}/vvenc-${pkgver}"
	cp -r "install" "$pkgdir/usr"
	mkdir -p "$pkgdir/usr/share/licenses/vvenc"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/vvenc/"
}
