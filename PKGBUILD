pkgname=xcman
pkgver=1.0
pkgrel=1
pkgdesc="Minimal compositing manager for X"
arch=('x86_64')
url='https://github.com/maandree/xcman'
license=('MIT')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'libxext')
source=(https://github.com/maandree/xcman/archive/$pkgver.tar.gz)
sha256sums=('ca3c3ebaed322303e9a185ab1ec5d12022f498ca61b3db439339896eeadc2320')

build() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
