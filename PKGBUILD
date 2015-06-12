# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libgamma
pkgver=0.7.2
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps"
arch=(i686 x86_64)
url="https://github.com/maandree/libgamma"
license=('GPL3' 'custom:GFDL1.3')
depends=(glibc libxcb libx11 libxxf86vm libdrm)
makedepends=(glibc libxcb libx11 libxxf86vm libdrm sh make grep sed coreutils gcc general-preprocessor python3 texinfo bash pkg-config)
install=libgamma.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(a29ddbd96eff868d5c61e793642813a6a4f6cfe358654227502bb91e95cb75db)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --linux
  make PREFIX=/usr lib info
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install-base install-info DESTDIR="$pkgdir"
}

