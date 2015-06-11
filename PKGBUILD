# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libspoton
pkgver=0.22
pkgrel=1
pkgdesc='Binding library for Spot-On'
url='http://spot-on.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('sqlite' 'libgcrypt>=1.5' 'libntru')
makedepends=('sqlite' 'libgcrypt>=1.5' 'make' 'gcc' 'coreutils')
source=("spot-on-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/spot-on/Version%20${pkgver}/Spot-On.d.tar.gz")
sha256sums=('94f5ffcc98eae7d79c796866ac1d9ab45e739e1c71d7b95359f2663f29f46021')


build() {
    cd "$srcdir/spot-on.d/libSpotOn"
    make
}

package () {
    cd "$srcdir/spot-on.d/libSpotOn"
    install -dm755 -- "$pkgdir/usr/lib"
    install -m755 -- libspoton.so "$pkgdir/usr/lib/libspoton.so"
    install -dm755 -- "$pkgdir/usr/include"
    install -m755 -- libspoton.h "$pkgdir/usr/include/libspoton.h"
}

