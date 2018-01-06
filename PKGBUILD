pkgname=xcman
pkgver=1.1
pkgrel=1
pkgdesc="Minimal compositing manager for X"
arch=('x86_64')
url='https://github.com/maandree/xcman'
license=('custom:ISC')
depends=('libxcomposite' 'libxdamage' 'libxrender')
source=(https://github.com/maandree/xcman/archive/$pkgver.tar.gz)
sha256sums=('c70aea4d7f7831a219d86c0530934b8ab80812e2304d93a098c5985fb8cb8244')

build() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
