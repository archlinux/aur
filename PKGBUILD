# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Anton Shestakov <engored*ya.ru>

pkgname=hqx
pkgver=1.2
pkgrel=1
pkgdesc="A fast, high-quality magnification filter designed for pixel art."
arch=('i686' 'x86_64')
url="https://github.com/grom358/hqx"
license=('LGPL')
depends=('devil')
source=(hqx-$pkgver.tar.gz::"https://github.com/grom358/hqx/archive/v$pkgver.tar.gz")
sha256sums=('5a44f1745b7fb0321c1d244822d79505df7cf85cfe383ee70b16f5bcd6803396')

build() {
  cd $pkgname-$pkgver

  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
