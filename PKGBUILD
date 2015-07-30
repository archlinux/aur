# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libntru
pkgver=0.4
pkgrel=1
pkgdesc='C Implementation of NTRUEncrypt'
url='https://github.com/tbuktu/libntru'
arch=('i686' 'x86_64')
license=('custom:2-clause BSD')
depends=('glibc')
makedepends=('gcc' 'glibc' 'make' 'coreutils')
source=("https://github.com/tbuktu/libntru/archive/${pkgver}.tar.gz")
sha256sums=('90c21c7609016edea03b753def6ffc8abb1f33a7350beb8d889fba96a7b5a4d8')

build ()
{
    cd "${srcdir}/libntru-${pkgver}"
    unset CC

    make -f Makefile.linux
}

package ()
{
    cd "${srcdir}/libntru-${pkgver}"
    unset CC

    make -f Makefile.linux install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}/usr/share"
}

