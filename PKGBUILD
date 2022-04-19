# Maintainer: Fabian Brosda <fabi3141@gmx.de>

pkgname=gauche-kyotocabinet
pkgver=0.8
pkgrel=1
pkgdesc='Gauche bindings for kyotocabinet'
url='https://karme.de/gauche-kyotocabinet/'
arch=('i686' 'x86_64')
depends=('gauche' 'kyotocabinet')
makedepends=('make' 'autoconf')
license=('BSD')

# include any patches you want to have applied here
source=('http://karme.de/gauche-kyotocabinet/gauche-kyotocabinet-0.8.tgz')
sha256sums=('a195f1a9849ced27a2b52bd6c5c010879d40cd52bc8f0841fa39bb2130d3d36c')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
