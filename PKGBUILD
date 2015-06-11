# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libspoton
pkgver=0.22
pkgrel=2
pkgdesc='Binding library for Spot-On'
url='http://spot-on.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('sqlite' 'libgcrypt>=1.5' 'libntru')
makedepends=('sqlite' 'libgcrypt>=1.5' 'make' 'gcc' 'coreutils')
source=("https://github.com/textbrowser/spot-on/archive/v${pkgver}.tar.gz")
sha256sums=('b6c2015274e9fca2f887f1f9638f8d6c50514987b9081c5e86044246da32ce80')


build() {
    cd "$srcdir/spot-on-${pkgver}/libSpotOn"
    make
}

package () {
    cd "$srcdir/spot-on-${pkgver}/libSpotOn"
    install -dm755 -- "$pkgdir/usr/lib"
    install -m755 -- libspoton.so "$pkgdir/usr/lib/libspoton.so"
    install -dm755 -- "$pkgdir/usr/include"
    install -m755 -- libspoton.h "$pkgdir/usr/include/libspoton.h"
}

