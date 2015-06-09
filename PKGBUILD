# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=libvcard
pkgver=1.0.2
pkgrel=1
pkgdesc="A C++ library for vCard specification"
arch=(i686 x86_64)
url="https://code.google.com/p/libvcard/"
license=('BSD')
source=("https://libvcard.googlecode.com/files/${pkgname}-${pkgver}.zip")
md5sums=('91f7fa5f3c01f62c56133883c98b33b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="${pkgdir}" install
}

