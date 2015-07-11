# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Anton Shestakov <engored*ya.ru>

pkgname=hqx
pkgver=1.1
pkgrel=1
pkgdesc="A fast, high-quality magnification filter designed for pixel art."
arch=('i686' 'x86_64')
url="http://code.google.com/p/hqx/"
license=('LGPL')
depends=('devil')
source=("http://hqx.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha256sums=('cc18f571fb4bc325317892e39ecd5711c4901831926bc93296de9ebb7b2f317b')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr LIBS="-lpthread"
  make -j1
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
