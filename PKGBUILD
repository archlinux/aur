# Maintainer: Simon Cruanes <simon.cruanes.2007@m4x.org>
pkgname=kristall
pkgver=0.4
pkgrel=0
pkgdesc="A high-quality visual cross-platform gemini browser."
arch=('x86_64')
url="https://github.com/MasterQ32/kristall"
license=('GPL3')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'openssl' 'qt5-svg')
source=("https://github.com/MasterQ32/kristall/archive/V0.4.tar.gz")
b2sums=('262742ae96829773883337e258f52e89d102fc2cb543438b964a0e59fef91f5316a8a586e447657fd472a2346bf7b1490c1d913d47528272d3c04bd6da113b88')

prepare() {
  # Fix desktop launcher icon name (allow per-theme override)
  sed -i 's/net.random-projects.//' $pkgname-$pkgver/Kristall.desktop
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX='/usr' DESTDIR="$pkgdir" install
}

