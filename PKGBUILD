# Maintainer: dummyx <dummyxa at gmail dot com>

pkgname=vvenc
pkgver=1.3.1
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
sha256sums=('ffe5daa2c2ea883646f105883c76ab40c067cf98de1713ce1aaa8c62fcc8202b')

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