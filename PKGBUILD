# Maintainer: Kridsada Thanabulpong <sirn@ogsite.net>
_pkgname="ibus-libthai"
pkgname="ibus-libthai-svn"
pkgver="svn"
pkgrel=1
pkgdesc="IBus engine module for LibThai"
url="http://linux.thai.net/websvn/wsvn/software.ibus-libthai"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('ibus' 'libthai')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("${_pkgname}::svn+http://linux.thai.net/svn/software/${_pkgname}/trunk")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "${_pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}
