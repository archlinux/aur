# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=libnpa
pkgver=0.3.5
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc='Free library for manipulating Nitroplus game files'
url='http://dev.pulsir.eu/krofna/'
depends=('boost-libs')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/libnpa/archive/v$pkgver.tar.gz")
sha256sums=('94bbeb21f283d1963dc80467e674739cdc072ff8b52268ddf48e5f8d13281265')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
