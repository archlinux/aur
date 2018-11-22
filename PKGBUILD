# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnpa
pkgver=0.5.3
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc='Free library for manipulating Nitroplus game files'
url='http://dev.pulsir.eu/krofna/'
depends=('boost-libs' 'zlib')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5d8423b5e5e859a15cb84932005d7e33e93b463145d0570626ec8c67f6e803c8')

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
