# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-ind-zlm
pkgver=0.1.2
pkgrel=1
pkgdesc="Apertium translation pair for Indonesian and Malay"
url="https://github.com/apertium/${pkgname}"
license=('GPL3')
makedepends=('pkgconf' 'autoconf')
depends=('apertium>=3.4.2' 'apertium-lex-tools' 'vislcg3' 'apertium-ind' 'apertium-zlm')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1d15267afe192a4053b52b5173d765faff4d2fd8f9d381a6b8e12886b83891e9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix=/usr
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
