# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=redshift-adjust
pkgver=1
pkgrel=1
pkgdesc="Script for manually adjusting the colour temperature with hotkeys"
arch=(any)
url="https://github.com/maandree/redshift-adjust"
license=('GPL3')
depends=(redshift bash coreutils)
makedepends=(make coreutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(1a24d0d286ec0392aa080c886831b801327d7760a9322377c9e4dc4453c4b68b)


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}


package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr install DESTDIR="$pkgdir"
}

