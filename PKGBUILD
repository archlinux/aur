# Maintainer: Alexandros Theodotou <alex at zrythm dot org>

pkgname=lsp-dsp-lib
pkgver=0.5.12
pkgrel=1
pkgdesc='DSP library for signal processing'
arch=('any')
url='https://github.com/sadko4u/lsp-dsp-lib'
license=('LGPL3')
makedepends=('pkg-config')
source=("https://github.com/sadko4u/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-src.tar.gz")
sha512sums=('f607c2bf3bd05b90c8942a907310c584fefb9f5a51cf55b58b6a5a821f1e2d608685342a36ce4686991099632158566d22b1768c2083792e8db341352c30ddd5')

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
