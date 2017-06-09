# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=ksmoothdock
pkgver=5.7
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=('i686' 'x86_64')
url='https://github.com/dangvd/ksmoothdock'
license=('GPL3')
depends=('qt5-base' 'plasma-framework')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("https://github.com/dangvd/ksmoothdock/archive/v5.7.tar.gz")
sha256sums=('f1c9aa98516a6d249e77a403ae93cf8db1ab54200495750586c1eefebfd4d5a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake src \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
