# Maintainer: lks <lukas dot graetz at web dot de>
# Contributor: Xianwen Chen <xianwen.chen@gmail.com>

pkgname=biogeme
pkgver=2.5
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
sha256sums=('88548e99f4f83c24bf7ddb8e0de07588adc2bec515569c56e816ed5b20a624b3')

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
