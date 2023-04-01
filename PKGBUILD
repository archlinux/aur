# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=ciao-lang
pkgver=1.22.0.m1
pkgrel=1
pkgdesc="Ciao is a general purpose, multi-paradigm programming language in the Prolog family"
arch=('i686' 'x86_64')
url="https://github.com/ciao-lang/ciao"
license=('LGPL-2.1')
depends=('rlwrap')
makedepends=('gcc' 'make' 'which' 'rlwrap')
source=(https://github.com/ciao-lang/ciao/archive/v1.22.0-m1.tar.gz)
sha256sums=('30e107fe38d10d70967afd389b243a37877ce8847edbb023713d083d253cac9b')

build() {
    cd "$srcdir/ciao-1.22.0-m1"

    ./ciao-boot.sh configure --prefix="$pkgdir/usr" --instype=global
    ./ciao-boot.sh build
}

package() {
    cd "$srcdir/ciao-1.22.0-m1"
    ./ciao-boot.sh install
}
