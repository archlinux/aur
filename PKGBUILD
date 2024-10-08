# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=jlibgamma
pkgver=1.0.3
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Java"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/jlibgamma"
license=('custom:ISC')
depends=('java-runtime-headless>=1.5' 'libgamma>=0.7.4')
makedepends=('java-environment>=1.5' 'libgamma>=0.7.4')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(0f0eee2293d2fd0ca3f79090f1590d3c680734b636c5699acad831a6fa93c0d7)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr JAVA_HOME=/usr/lib/jvm/default DESTDIR="$pkgdir" install
}
