pkgname=xcman
pkgver=1.1
pkgrel=2
pkgdesc="Minimal compositing manager for X"
arch=('x86_64')
url='https://codeberg.org/maandree/xcman'
license=('custom:ISC')
depends=('libxcomposite' 'libxdamage' 'libxrender')
source=($pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=('bf1b6a712bf759ccd40afac3203b82907f114a1862e597f96c27764ce5cc9ede')

build() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
