# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=unstickpixels
pkgver=2
pkgrel=1
pkgdesc="Screen loop to try to unstick stuck dots"
arch=(i686 x86_64)
url="https://github.com/maandree/unstickpixels"
license=('GPL3' 'custom:GFDL1.3')
depends=(glibc libgamma)
makedepends=(glibc libgamma make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(6f41482108a68b8a6deaefcb5d46d6fff4806947af463b717ce8b77cedaec97f)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

