# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Carlos Ruiz <cailovirtual@gmail.com>

pkgname=taglib-sharp
pkgver=2.1.0.0
pkgrel=3
pkgdesc="Library for reading and writing metadata in media files for Mono"
arch=('any')
url="https://github.com/mono/taglib-sharp"
license=('LGPL2.1')
depends=('mono')
source=(https://github.com/mono/taglib-sharp/archive/$pkgname-$pkgver.tar.gz)
sha256sums=('8221fccfc2e834eebb24404f2c0ca26b2788af646a172266f89627a5d339bdec')

prepare() {
  cd $pkgname-$pkgname-$pkgver
  sed -i 's/gmcs/mcs/' configure.ac
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname-$pkgname-$pkgver
  ./configure --prefix=/usr --disable-docs
  make
}

package() {
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
