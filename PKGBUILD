# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=fuse-ufs
pkgver=0.3.0
pkgrel=1
pkgdesc="FUSE implementation of FreeBSD's UFSv2"
arch=(x86_64)
url="https://github.com/realchonk/fuse-ufs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realchonk/fuse-ufs/archive/refs/tags/${pkgver}.tar.gz")
license=('BSD-2-Clause')
sha256sums=('3646983348c848e8270acadcf606e239265829e2904984a4ecfe84d4db90a71e')
makedepends=('cargo')
depends=('fuse3')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
