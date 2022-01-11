# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=lsp-dsp-lib
pkgver=0.5.14
pkgrel=1
pkgdesc='DSP library for signal processing'
arch=('any')
url='https://github.com/sadko4u/lsp-dsp-lib'
license=('LGPL3')
makedepends=('pkg-config')
source=("https://github.com/sadko4u/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-src.tar.gz")
sha512sums=('73f65196fdf723781ea2dbfdf11c7229c7f90679fc377e4916d8259b715734724a8b62f9c45d035d6b119c9ae77c1648a00fe00183315330e0e2a9e711695d79')

build() {
  cd "$pkgname"

  make config PREFIX=/usr
  cat ./.config.mk
  #make fetch
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
