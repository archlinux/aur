# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=jlibgamma
pkgver=1.0.2
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Java"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/jlibgamma"
license=('custom:ISC')
depends=('java-runtime-headless>=1.5' 'libgamma>=0.3' glibc)
makedepends=('java-environment>=1.5' 'libgamma>=0.3' glibc gcc make coreutils sed)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(7cd2d93b08db6f3c3bc62f0a684952783dbafc7fc16c5f1cf2be7d09c48fb564)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default install DESTDIR="$pkgdir"
}
