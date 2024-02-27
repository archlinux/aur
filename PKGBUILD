# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=QMamehook
pkgname=qmamehook
pkgver=1.2
pkgrel=1
pkgdesc='A stripped-down reimplementation of MAMEHOOKER for light guns.'
arch=('x86_64' 'aarch64')
url='https://github.com/SeongGino/QMamehook'
license=('LGPL-2.0-only')
depends=('qt5-base' 'qt5-serialport' 'icu')
makedepends=('cmake')
source=("https://github.com/SeongGino/QMamehook/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c6e762c01ce8458cad34edb3ec88c26b')

build() {
  mkdir "$srcdir/$_name-$pkgver/build"
  cd "$srcdir/$_name-$pkgver/build"
  cmake ..
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver/build/QMamehook" "$pkgdir/usr/bin/QMamehook"
}
