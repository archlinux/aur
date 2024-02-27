# Maintainer: That One Seong <ThatOneSeong@protonmail.com>

_name=GUN4ALL-GUI
pkgname=gun4all-gui
pkgver=1.0
pkgrel=1
pkgdesc='Configuration utility for the IR-GUN4ALL DIY light-gun system.'
arch=('x86_64' 'aarch64')
url='https://github.com/SeongGino/GUN4ALL-GUI'
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'icu')
makedepends=('cmake')
install=$pkgname.install
source=("https://github.com/SeongGino/GUN4ALL-GUI/archive/refs/tags/v${pkgver}-1.tar.gz")
# TODO: -1 is a minor release
md5sums=('b04ee547698bd518ad30d1273a104a06')

build() {
  mkdir "$srcdir/$_name-$pkgver-1/build"
  cd "$srcdir/$_name-$pkgver-1/build"
  cmake ..
  make
}

package() {
  install -Dm755 "$srcdir/$_name-$pkgver-1/build/G4A-GUImain" "$pkgdir/usr/bin/G4A-GUI"
}
