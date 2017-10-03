# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Anton Shestakov <engored*ya.ru>

pkgname=hqx
pkgver=1.1
pkgrel=2
pkgdesc="A fast, high-quality magnification filter designed for pixel art."
arch=('i686' 'x86_64')
url="https://github.com/grom358/hqx"
license=('LGPL')
depends=('devil')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/hqx/hqx-1.1.tar.gz")
sha256sums=('cc18f571fb4bc325317892e39ecd5711c4901831926bc93296de9ebb7b2f317b')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make -j1
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
