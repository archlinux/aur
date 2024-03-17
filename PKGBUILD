# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=ciao-lang
pkgver=1.23.0.m1
_pkgver=1.23.0-m1
pkgrel=1
pkgdesc="Ciao is a general purpose, multi-paradigm programming language in the Prolog family"
arch=('i686' 'x86_64')
url="https://github.com/ciao-lang/ciao"
license=('LGPL-2.1')
depends=('rlwrap')
makedepends=('gcc' 'make' 'which' 'rlwrap')
source=(https://github.com/ciao-lang/ciao/archive/v${_pkgver}.tar.gz)
sha256sums=('ba6318c2d6e994c4dd5e02f4a60b026d7cdd7be8bd472fa0b8665fa439e52d3b')

build() {
    cd "$srcdir/ciao-$_pkgver"

    ./ciao-boot.sh configure --prefix="$pkgdir/usr" --instype=global
    ./ciao-boot.sh build
}

package() {
    cd "$srcdir/ciao-$_pkgver"
    ./ciao-boot.sh install
}
