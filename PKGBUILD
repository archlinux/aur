# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=ciao-lang
pkgver=1.20.0
pkgrel=1
pkgdesc="Ciao is a general purpose, multi-paradigm programming language in the Prolog family"
arch=('i686' 'x86_64')
url="https://github.com/ciao-lang/ciao"
license=('LGPL-2.1')
depends=('rlwrap')
makedepends=('gcc' 'make' 'which' 'rlwrap')
source=(https://github.com/ciao-lang/ciao/archive/v${pkgver}.tar.gz)
sha256sums=('7b2f4e5824ab7cd02e9889faa797d78ee40b92468df900a0d15c3044e032e908')

build() {
    cd "$srcdir/ciao-$pkgver"

    ./ciao-boot.sh configure --prefix="$pkgdir/usr" --instype=global
    ./ciao-boot.sh build
}

package() {
    cd "$srcdir/ciao-$pkgver"
    ./ciao-boot.sh install
}