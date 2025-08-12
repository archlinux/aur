# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=QMamehook
_QTver=Qt6
pkgname=qmamehook
pkgver=2.2
pkgrel=1
pkgdesc='A stripped-down reimplementation of MAMEHOOKER for light guns.'
arch=('x86_64' 'aarch64')
url='https://github.com/SeongGino/QMamehook'
license=('LGPL-2.0-only')
depends=('qt6-base' 'qt6-serialport' 'icu')
makedepends=('cmake')
source=("https://github.com/SeongGino/QMamehook/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('7911be7046b689150b634d0cfcf01d89')

build() {
  cmake -B "$srcdir/$_name-$pkgver/build" -DCMAKE_BUILD_TYPE=Release -DQMH_QT_VERSION=$_QTver -S "$srcdir/$_name-$pkgver"
  cmake --build "$srcdir/$_name-$pkgver/build" --config Release
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver/build/QMamehook" "$pkgdir/usr/bin/QMamehook"
}
