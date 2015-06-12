# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libgammamm
pkgver=1.0.1
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and C++"
arch=(i686 x86_64)
url="https://github.com/maandree/libgammamm"
license=('GPL3')
depends=('libgamma>=0.3' glibc gcc-libs)
makedepends=('libgamma>=0.3' glibc gcc-libs gcc make coreutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(712df650ffcc4666421e952c52b94660f371e8fb401a7d0e2ffd196580b84d50)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

