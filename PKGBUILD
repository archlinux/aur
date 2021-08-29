# Maintainer: dummyx <dummyxa at gmail dot com>

pkgname=vvenc
pkgver=1.1.0
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
sha256sums=('382cbf7d8dec1231a06759ce2a5d58fc53041e2dab85ed6b6478b866e38d0377')

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