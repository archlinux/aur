# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=fuse-ufs
pkgver=0.4.3
pkgrel=1
pkgdesc="FUSE implementation of FreeBSD's UFSv2"
arch=(x86_64)
url="https://github.com/realchonk/fuse-ufs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realchonk/fuse-ufs/archive/refs/tags/${pkgver}.tar.gz")
license=('BSD-2-Clause')
sha256sums=('937915f823c5872a97974743299396bc17bc50d2e45b86b8bcbed4cb825bcb0a')
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
