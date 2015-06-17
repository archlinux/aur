#Maintainer: M0Rf30

pkgname=lorcon-old-git
pkgver=1.659d7d9
pkgrel=1
pkgdesc='LORCON wireless packet injection library'
url='http://802.11ninja.net/svn/lorcon/branch/lorcon-old/'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git')
depends=('libnl1' 'libpcap')
md5sums=('SKIP')
source=('lorcon-old::git://github.com/M0Rf30/lorcon-old.git')


build() {
  cd lorcon-old
  ./configure --prefix=/usr
  make
}

package() {
  cd lorcon-old
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd lorcon-old
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
