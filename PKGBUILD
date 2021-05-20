
pkgname=hfst
pkgver=3.15.4
pkgrel=1
pkgdesc='Helsinki Finite-State Technology (library and application suite)'
arch=('i686' 'x86_64')
url='https://github.com/hfst/hfst'
license=('GPL3')
makedepends=('pkgconf>=0.14' 'gcc' 'make' 'bison>=2.4' 'flex' 'autoconf>=2.62' 'automake>=1.11.1' 'libtool>=2.2' 'gettext>=0.17')
depends=('gcc-libs>=2.16')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hfst/hfst/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('26e1aea3fd5aaaddd892a41db37418b324e7260a202a1ca33507e7662431fd9a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
