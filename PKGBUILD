# Maintainer: Marc Riera <marcriera@softcatala.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=apertium-separable
pkgver=0.7.1
pkgrel=1
pkgdesc="Module for reordering separable/discontiguous multiwords."
url="https://wiki.apertium.org/wiki/Apertium_separable"
license=('GPL3')
makedepends=('pkgconf' 'autoconf' 'gcc' 'utf8cpp')
depends=('lttoolbox>=3.7.8' 'zlib')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apertium/apertium-separable/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8c258bc3e40323a60d2eae831b04b15c175ccf8a805fe0919025b3c01c135f24')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
