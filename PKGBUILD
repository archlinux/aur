# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libntru
pkgver=0.3
pkgrel=1
pkgdesc='C Implementation of NTRUEncrypt'
url='https://github.com/tbuktu/libntru'
arch=('i686' 'x86_64')
license=('custom:2-clause BSD')
depends=('glibc')
makedepends=('gcc' 'glibc' 'make' 'coreutils')
source=("https://github.com/tbuktu/libntru/archive/${pkgver}.tar.gz")
sha256sums=('9ce6b6a20ca304c09d2ff853e3b5762880a8cb85728113b26eb8ca2e915e2a0a')

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

