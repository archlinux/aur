# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=steins-gate
pkgver=0.5.3
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
pkgdesc='Libre reimplementation of the Steins;Gate visual novel'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpengine>=$pkgver")
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a1d674432f6bc5bcc31ac0227e0a2cd0927fc8089614fb4395149d50af60ff5c')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
