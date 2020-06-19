# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=foma
pkgver=0.9.18
pkgrel=2
pkgdesc="A set of utilities for constructing finite-state automata and transducers"
arch=('i686' 'x86_64')
url="https://code.google.com/p/foma/"
license=('Apache')
depends=('zlib' 'termcap' 'readline')
source=(https://bitbucket.org/mhulden/foma/downloads/foma-${pkgver}.tar.gz)
md5sums=('70c8d11f477bec87cc5a5a1e4ad57ee5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix=/usr CFLAGS="-O3 -Wall -D_GNU_SOURCE -std=c99 -fvisibility=hidden -fPIC -fcommon"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix="${pkgdir}/usr" install
}

# vim:set ts=2 sw=2 et:
