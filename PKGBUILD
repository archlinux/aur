# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=epkill
pkgver=1.1.1
pkgrel=1
pkgdesc="procps utilties with environment constraints"
arch=(i686 x86_64)
url="https://github.com/maandree/epkill"
license=('GPL3' 'custom:GFDL1.3')
depends=(glibc procps-ng argparser)
makedepends=(glibc procps-ng argparser gcc texinfo)
install=epkill.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(d1c10e6f5be7809861f5130118c096a1cf411e0af66167bd0719f6a38d55022c)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

