# Maintainer: Michael Herzberg <{firstname}@{firstinitial}{lastname}.de>

pkgname=moonlight-qt
pkgver=0.1.0
pkgrel=1
pkgdesc='GameStream client for PCs (Windows, Mac, and Linux)'
arch=('x86_64')
license=('GPL')
url='https://moonlight-stream.com'
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs')
source=($pkgname::"git+https://github.com/moonlight-stream/${pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  qmake PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "$pkgname"
  make install
}
