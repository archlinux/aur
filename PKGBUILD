# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=jlibgamma
pkgver=1.1
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Java"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/jlibgamma"
license=('custom:ISC')
depends=('java-runtime-headless>=1.5' 'libgamma>=0.9')
makedepends=('java-environment>=1.5' 'libgamma>=0.9')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(07802335f5f9cdf9ad170f7b498ed1738a30d7330f0b890ed7c43b6ed2a2c621)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default DESTDIR="$pkgdir" install
}
