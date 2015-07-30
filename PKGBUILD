# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libntru
pkgver=0.4.1
pkgrel=1
pkgdesc='C Implementation of NTRUEncrypt'
url='https://github.com/tbuktu/libntru'
arch=('i686' 'x86_64')
license=('custom:2-clause BSD')
depends=('glibc')
makedepends=('gcc' 'glibc' 'make' 'coreutils')
source=("https://github.com/tbuktu/libntru/archive/${pkgver}.tar.gz")
sha256sums=('a540763f12c496b057f75c7684274bafb4e62984e6b713720ceb7ea8f31229e5')

build ()
{
    cd "${srcdir}/libntru-${pkgver}"

    make -f Makefile.linux
}

package ()
{
    cd "${srcdir}/libntru-${pkgver}"

    make -f Makefile.linux install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}/usr/share"
}

