# Maintainer: Bob Gregory <pathogenix@gmail.com>
pkgname=libfastjson
pkgver=0.99.0
pkgrel=1
pkgdesc="A performance-focused json library for C"
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/rsyslog/$pkgname/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('205b35b870ea60621923814edb4f5a94')

build() {
      cd "$pkgname-$pkgver"
        autoreconf -fvi
        ./configure --prefix=/usr
        make
      }

package() {
    cd "$pkgname-$pkgver"

      make DESTDIR="$pkgdir/" install
  }

check () {
    make check
}
