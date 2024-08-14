# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=fuse-ufs
pkgver=0.2.0
pkgrel=1
pkgdesc="FUSE implementation of FreeBSD's UFSv2"
arch=(x86_64)
url="https://github.com/realchonk/fuse-ufs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/realchonk/fuse-ufs/archive/refs/tags/${pkgver}.tar.gz")
license=('BSD')
sha256sums=('9a23f69abace347dba309326cc23834a1f760071b3f5b20768159218719e294b')
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
