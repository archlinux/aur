# Maintainer: M0Rf30

pkgname=kdm-plugin-pam-face-authentication
pkgver=0.2
pkgrel=1
pkgdesc="PAM face auth - KDM plugin"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pam-face-authentication"
license=('GPL')
depends=('kdebase-workspace' 'pam-face-authentication')
makedepends=('cmake' 'automoc4')
source=(http://pam-face-authentication.googlecode.com/files/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -D CMAKE_INSTALL_PREFIX=/usr/ .
  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('3174cb6915d8f08c02bd6858d9164779')
