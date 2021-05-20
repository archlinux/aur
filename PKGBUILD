# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-fin
pkgver=0.0.2
pkgrel=1
pkgdesc="Finnish monolingual data and morphological analyser-generator for apertium"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf')
depends=('apertium>=3.4.2' 'vislcg3' 'hfst')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('865fb5f258b1ab9417c2fe9473340e86e21673c236b31b2909dfa6f8b9a56892')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix=/usr
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
