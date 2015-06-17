#Maintainer: M0Rf30

pkgname=lorcon-git
pkgver=13.c50fdac
pkgrel=1
pkgdesc='LORCON wireless packet injection library'
url='https://code.google.com/p/lorcon/'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git')
depends=('libnl' 'libnl1' 'libpcap')
conflicts=('lorcon')
md5sums=('SKIP')
source=('lorcon::git+https://code.google.com/p/lorcon/')


build() {
  cd lorcon
  ./configure --prefix=/usr
  make
}

package() {
  cd lorcon
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd lorcon
  echo $(git rev-list --count master).$(git rev-parse --short master)
}