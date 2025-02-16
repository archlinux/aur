# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=fuse-ufs
pkgver=0.4.4
pkgrel=1
pkgdesc="FUSE implementation of FreeBSD's UFSv2"
arch=(x86_64)
url="https://github.com/realchonk/fuse-ufs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realchonk/fuse-ufs/archive/refs/tags/${pkgver}.tar.gz")
license=('BSD-2-Clause')
sha256sums=('34a8f51afb6681d83c37b04458a8042bc5bc6d24a40cbbd9ad3ca597a9de18f6')
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
