pkgname=xcman
pkgver=1.1
pkgrel=2
pkgdesc="Minimal compositing manager for X"
arch=('x86_64')
url='https://github.com/maandree/xcman'
license=('custom:ISC')
depends=('libxcomposite' 'libxdamage' 'libxrender')
source=($pkgname-$pkgver::https://github.com/maandree/xcman/archive/$pkgver.tar.gz)
sha256sums=('04c6047ebde5d846dbe9ad6b9eadf91e691c6b445f97d9e3a72329eb0de24630')

build() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
