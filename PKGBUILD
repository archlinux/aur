# Maintainer: Jiehong Ma <email@majiehong.com>
# From: PKGBUILD of community/brise

pkgname=brise-extra
pkgver=0.35
pkgrel=2
pkgdesc="Rime schema repository with extra methods installed (array30, scj6, stenotype, traditional wubi)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rimeime/"
license=('GPL3')
depends=()
makedepends=('cmake' 'git' 'librime>=1.2')
provides=('librime-data' 'brise')
conflicts=('librime<1.2' 'ibus-rime<1.2' 'brise')
source=("git+https://github.com/lotem/brise.git#tag=brise-$pkgver" "Makefile.patch")
sha512sums=('SKIP'
            'fb50ba9f6d5ea8aa81be8f1823040a175809e844e4426228188749ef178dec496aa44571cd5980845bc5392a1c1476871c676f32ba3ab917ddc1c01008ee6018')

prepare()
{
  cd brise/
  patch Makefile ../Makefile.patch
}

build() {
  cd brise
  make
}

package() {
  cd brise
  make DESTDIR="$pkgdir" install
}
