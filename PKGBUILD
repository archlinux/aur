# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>                                                                            
pkgname=xcman
pkgver=1.1.2
pkgrel=1
pkgdesc="Minimal compositing manager for X"
arch=('x86_64')
url='https://codeberg.org/maandree/xcman'
license=('custom:ISC')
depends=('libxcomposite' 'libxdamage' 'libxrender')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(2b829bb90de763bb13bb4db8c0d626958a4508e835024b87432398f96d81b091)

build() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
