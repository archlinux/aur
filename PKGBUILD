# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=socat-git
pkgver=1.7.3.3.r9.g82cf4ae
pkgrel=1
pkgdesc="Multipurpose relay"
arch=('i686' 'x86_64')
url="http://www.dest-unreach.org/socat/"
license=('GPL2')
depends=('glibc' 'openssl' 'readline')
makedepends=('git' 'yodl')
provides=('socat')
conflicts=('socat')
source=("git+https://repo.or.cz/socat.git")
sha256sums=('SKIP')


pkgver() {
  cd "socat"

  git describe --long --tags | sed 's/^tag-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "socat"

  autoconf -f
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "socat"

  #make test
}

package() {
  cd "socat"

  make DESTDIR="$pkgdir" install
}
