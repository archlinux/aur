# Maintainer:   Razer <razer[AT]neuf[DOT]fr>

pkgname=rf24-network
pkgver='1.1.7.r8.gc94f877'
pkgver() {
  cd RF24Network
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='Networking with RF24 radio modules'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://tmrh20.github.io/RF24Network/'
license=('MIT')
depends=('rf24')
source=('git://github.com/TMRh20/RF24Network')
md5sums=('SKIP')

build() {
  cd "$srcdir/RF24Network"
  sed 's/@ldconfig//' Makefile > Makefile.copy
  mv Makefile.copy Makefile
  make
}

package() {
  cd "$srcdir/RF24Network"
  make PREFIX="$pkgdir/usr" install 
}

