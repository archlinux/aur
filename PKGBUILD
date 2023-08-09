# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=ciao-lang
pkgver=1.22.0.m7
pkgrel=1
pkgdesc="Ciao is a general purpose, multi-paradigm programming language in the Prolog family"
arch=('i686' 'x86_64')
url="https://github.com/ciao-lang/ciao"
license=('LGPL-2.1')
depends=('rlwrap')
makedepends=('gcc' 'make' 'which' 'rlwrap')
source=(https://github.com/ciao-lang/ciao/archive/v1.22.0-m7.tar.gz)
sha256sums=('b5f75753a558dd9505888862ea831200b16fbe530741d5f1ffd62452d4eec5e2')

build() {
    cd "$srcdir/ciao-1.22.0-m7"

    ./ciao-boot.sh configure --prefix="$pkgdir/usr" --instype=global
    ./ciao-boot.sh build
}

package() {
    cd "$srcdir/ciao-1.22.0-m7"
    ./ciao-boot.sh install
}
