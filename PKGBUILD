# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=lsp-dsp-lib
pkgver=1.0.7
pkgrel=1
pkgdesc='DSP library for signal processing'
arch=('any')
url='https://github.com/sadko4u/lsp-dsp-lib'
license=('LGPL3')
makedepends=('pkg-config')
source=("https://github.com/sadko4u/$pkgname/releases/download/$pkgver/$pkgname-src-$pkgver.tar.gz")
sha512sums=('be6337ba450683bcfdb708785f26eb7476940da1c5b48c86746d694a07cbe1a30fdbe09ed6aa4b28b0c866ad336a1232d83e2ba6a20e068b2442292c661507a4')

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
