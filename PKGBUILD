# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>                                                                            
pkgname=xcman
pkgver=1.1.1
pkgrel=1
pkgdesc="Minimal compositing manager for X"
arch=('x86_64')
url='https://codeberg.org/maandree/xcman'
license=('custom:ISC')
depends=('libxcomposite' 'libxdamage' 'libxrender')
source=($pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=('4724a190506574f036fdad82255983aaa8eecb8cd2a65627d106c23d7f9a6ee6')

build() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
