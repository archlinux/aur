# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=ciao-lang
pkgver=1.24.0.m1
_pkgver=1.24.0-m1
pkgrel=1
pkgdesc="Ciao is a general purpose, multi-paradigm programming language in the Prolog family"
arch=('i686' 'x86_64')
url="https://github.com/ciao-lang/ciao"
license=('LGPL-2.1')
depends=('rlwrap')
makedepends=('gcc' 'make' 'which' 'rlwrap')
source=(https://github.com/ciao-lang/ciao/archive/v${_pkgver}.tar.gz)
sha256sums=('27ab8a35f5c8f42f30b40182752aa355e8d9183264285a54ae1bd37b938e7df4')

build() {
    cd "$srcdir/ciao-$_pkgver"

    ./ciao-boot.sh configure --prefix="$pkgdir/usr" --instype=global
    ./ciao-boot.sh build
}

package() {
    cd "$srcdir/ciao-$_pkgver"
    ./ciao-boot.sh install
}
