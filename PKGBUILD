# Maintainer: John Jenkins shaggytwodope@gmail.com
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: res <andres87p@gmail.com>

pkgname=uclibc
_pkgname=${pkgname/c/C}
pkgver=0.9.33.2
pkgrel=1
pkgdesc='C library for developing embedded Linux systems'
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.uclibc.org/"
source=(http://www.uclibc.org/downloads/${_pkgname}-${pkgver}.tar.xz)

build() {
    cd "$_pkgname-$pkgver"

    msg "Running make menuconfig"
    make menuconfig
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make PREFIX="$pkgdir" install
}

md5sums=('73e6fe215648d02246f4d195b25fb17e')
