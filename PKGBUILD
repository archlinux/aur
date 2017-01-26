# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libspoton
pkgver=2017.01.20
pkgrel=1
pkgdesc='Binding library for Spot-On'
url='http://spot-on.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('sqlite' 'libgcrypt>=1.5' 'libntru')
makedepends=('sqlite' 'libgcrypt>=1.5' 'make' 'gcc' 'coreutils')
source=("Spot-On-${pkgver}.zip::http://downloads.sourceforge.net/project/spot-on/Version%20${pkgver}/Spot-On-Src.d.zip?r=")
sha256sums=('45ff31d37092f653c0b94b4dc47b16f64c4b1327841bacfd8a4f624b63a6e04c')


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

