# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bootcleanse
pkgver=2
pkgrel=1
pkgdesc='Cleanse your system from old MBR codes and boot flags'
arch=(any)
url='https://github.com/maandree/bootcleanse'
license=(GPL3)
depends=(python3 sudo sh coreutils)
makedepends=(texinfo gzip)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(aed2f962a8b337263bfcc1aa215fc875babb1d5713143a9887d4cf8c3194b179)


build() {
    cd "$srcdir/bootcleanse-$pkgver"
    make
}

package() {
    cd "$srcdir/bootcleanse-$pkgver"
    make DESTDIR="${pkgdir}" install
}

