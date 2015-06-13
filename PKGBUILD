# Maintainer: vmalloc support@cyborg-connect.de
pkgname=embutils
pkgver=0.19
pkgrel=0.1
pkgdesc="embutils - small system utilities for embedded systems"
arch=('i686' 'x86_64')
url='http://www.fefe.de/embutils/'
license=('GPL')
depends=()
makedepends=('dietlibc')
options=()
source=(http://dl.fefe.de/${pkgname}-$pkgver.tar.bz2)
sha512sums=('ab74aa98c2f93ffb3bfb83353e09f5a5c342cc577d7f19d2789f4c4f2e716c3654a3a1a711bc2dfddbe9955ef370f80d6b62a3d564363855797609e9cb027705')

build() {
  export PATH=$PATH:/opt/diet/bin
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  export PATH=$PATH:/opt/diet/bin
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mkdir -p $pkgdir/usr/{bin,share}
}
