# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=epkill
pkgver=1.2
pkgrel=1
pkgdesc="procps utilties with environment constraints"
arch=(i686 x86_64)
url="https://github.com/maandree/epkill"
license=('GPL3' 'custom:GFDL1.3')
depends=(glibc procps-ng argparser exec-as)
makedepends=(glibc procps-ng argparser gcc texinfo)
install=epkill.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(0bf65a82172804ad9042e86e3dd20575f11af39904a3f8ecd93b20bc2e76c4b4)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

