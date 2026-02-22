# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=jlibgamma
pkgver=1.0.4
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Java"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/jlibgamma"
license=('custom:ISC')
depends=('java-runtime-headless>=1.5' 'libgamma>=0.7.4')
makedepends=('java-environment>=1.5' 'libgamma>=0.7.4')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(dbf66b55be176928d2301cf709e301540f54086f0ea6d7e141785415eb3f3355)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default DESTDIR="$pkgdir" install
}
