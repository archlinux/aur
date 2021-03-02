# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cc65
pkgver=2.19
pkgrel=1
pkgdesc='C compiler for 6502 family microprocessors'
arch=('i686' 'x86_64')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(https://github.com/cc65/cc65/archive/V${pkgver}.tar.gz)
b2sums=('c1c845417e38113c99a9ec8fbff1b90e292798582ac2b394e40419eff3eea62d838ea52165188516efc6157ef02aa7fc23c5a6510fd40d1012ad2b5231d78097')

build() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
