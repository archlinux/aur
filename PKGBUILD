# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=redshift-adjust
pkgver=2
pkgrel=1
pkgdesc="Script for manually adjusting the colour temperature with hotkeys"
arch=(any)
url="https://github.com/maandree/redshift-adjust"
license=('GPL3')
depends=(redshift bash coreutils)
makedepends=(make coreutils texinfo)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c004b2896dd92fae0bb8075f5c7cb7a0a4d68843d76341462530ada9dbfb73ed)


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}


package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr install DESTDIR="$pkgdir"
}

