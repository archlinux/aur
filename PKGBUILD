# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnpa
pkgver=0.4.0
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc='Free library for manipulating Nitroplus game files'
url='http://dev.pulsir.eu/krofna/'
depends=('boost-libs' 'zlib')
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3aaae30d65ae4f138e88cdc6ff0845160ff2e7c57601b8bbad1af8abb8255ea1')

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
