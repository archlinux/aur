# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=pylibgamma
pkgver=1.1.3.2
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps and Python 3"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pylibgamma"
license=('custom:ISC')
depends=(python3 'libgamma>=0.6' glibc)
makedepends=(python3 'libgamma>=0.6' glibc make gcc cython coreutils pkg-config)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(3f56116ed87b596c7e15cf48022cc24b99335c565954ac0a344c448f8b3b9c2ec139491fea772842a9523e4e107615d1f2cad65ac2f079184624910f77703db8)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
