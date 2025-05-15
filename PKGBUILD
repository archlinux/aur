# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=fuse-ufs
pkgver=0.5.0
pkgrel=1
pkgdesc="FUSE implementation of FreeBSD's UFSv2"
arch=(x86_64)
url="https://github.com/realchonk/fuse-ufs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realchonk/fuse-ufs/archive/refs/tags/${pkgver}.tar.gz")
license=('BSD-2-Clause')
sha256sums=('9dab4a86f3905c7fafd71e9303ddf75b2d36839a3ce4f808045f919ed9312dc2')
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
