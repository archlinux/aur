# Maintainer: lks <lukas dot graetz at web dot de>
# Contributor: Xianwen Chen <xianwen.chen@gmail.com>

pkgname=biogeme
pkgver="2.6a"
pkgrel=1
pkgdesc="an open source freeware designed for the estimation of discrete choice models"
arch=('i686' 'x86_64' 'armv7h')
url="http://biogeme.epfl.ch/"
license=('custom:"BIOGEME"')
depends=(
    bison
    python
    gtkmm3
)
makedepends=()
source=(
    "http://biogeme.epfl.ch/distrib/biogeme-${pkgver}.tar.gz"
)
sha256sums=('f6de0ea12f83ed183f31a41b9a56d1ec7226d2305549fb89ea7b1de8273ede49')

build() {
  cd biogeme-${pkgver}

  ./configure --prefix=/usr --enable-bison --enable-python --enable-gui
  make
}

package() {
  cd biogeme-${pkgver}

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
