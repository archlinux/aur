# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pylibgamma
pkgver=1.1
pkgrel=2
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://github.com/maandree/pylibgamma"
license=('GPL3')
depends=(python3 'libgamma>=0.6' glibc)
makedepends=(python3 'libgamma>=0.6' glibc make gcc cython coreutils pkg-config)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(51274db5645d6fec25fe61dd0d31af07354cb5d98cff8fc2d731258bea4552f3)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

