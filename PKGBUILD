# Maintainer: Kridsada Thanabulpong <sirn@ogsite.net>
pkgname="ibus-libthai"
pkgver="0.1.4"
pkgrel=3
pkgdesc="IBus engine module for LibThai"
url="https://github.com/tlwg/ibus-libthai"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('ibus' 'libthai')
optdepends=()
makedepends=()
conflicts=('ibus-libthai-svn')
replaces=('ibus-libthai-svn')
provides=("${pkgname}=${pkgver}")
backup=()
install=
source=("https://github.com/tlwg/ibus-libthai/archive/v${pkgver}.tar.gz")
sha256sums=('b5debc5cd9da3e32b3262d2da9aab296bf8ef27f85f44ef4c2200b0b883845e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo "${pkgver}" > VERSION
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
