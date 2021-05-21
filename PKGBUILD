# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>
pkgname=apertium-anaphora
pkgver=1.0.2
pkgrel=1
pkgdesc="Anaphora Resolution Module in Apertium for low resource languages"
url="https://wiki.apertium.org/wiki/Anaphora_resolution_module"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc')
depends=('apertium>=3.4.2')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-anaphora/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35539f483b04e3e149c759e06a92c1f967dbb750897dbb7c1bfb58bec39f87ed')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
