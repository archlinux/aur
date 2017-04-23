# Contributor: Kutabe <kutabe@ex.ua> 
# Maintainer: zoe <chp321 [at] gmail [dot] com> 
pkgname=liboil
pkgver=0.3.17
pkgrel=3
pkgdesc="Liboil is a library of simple functions that are optimized for various CPUs."
arch=('any')
url="https://liboil.freedesktop.org"
license=('BSD')
source=('https://liboil.freedesktop.org/download/liboil-0.3.17.tar.gz')
sha256sums=('105f02079b0b50034c759db34b473ecb5704ffa20a5486b60a8b7698128bfc69')

build() {
    ${pkgname}-${pkgver}/configure --prefix=/usr
    make
}

package() {
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/include/liboil-0.3/liboil/" "${pkgdir}/usr/include/"
    rmdir "${pkgdir}/usr/include/liboil-0.3/"
}
