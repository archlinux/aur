# Maintainer: Kridsada Thanabulpong <sirn@ogsite.net>
pkgname="ibus-libthai"
pkgver="0.1.3"
_pkgver="0_1_3"
pkgrel=1
pkgdesc="IBus engine module for LibThai"
url="https://github.com/tlwg/ibus-libthai"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('ibus' 'libthai')
optdepends=()
makedepends=()
conflicts=()
replaces=('ibus-libthai-svn')
backup=()
install=
source=("https://github.com/tlwg/ibus-libthai/archive/r_${_pkgver}.tar.gz")
sha256sums=('801454d5cda132d16cc93bb7c1af59c6427252d11f0b5a0ed3c5ff674664236f')

build() {
  cd "${srcdir}/${pkgname}-r_${_pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-r_${_pkgver}"
  make DESTDIR="$pkgdir/" install
}
