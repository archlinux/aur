# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=ksmoothdock
pkgver=5.6
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=('i686' 'x86_64')
url='https://github.com/dangvd/ksmoothdock'
license=('N/A')
depends=('qt5-base' 'plasma-framework')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("https://github.com/dangvd/ksmoothdock/archive/v5.6.tar.gz")
sha256sums=('1f4f8a7f9a2dbc1fe76b7f3fd43c1e531c5f7705dcd0f5d9edb2dd94f44c3cf9')

build() {
  cd $srcdir/$pkgname-$pkgver

  cmake src \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
