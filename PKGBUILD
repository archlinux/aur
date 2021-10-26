# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>
pkgname="ibus-libthai"
pkgver="0.1.5"
pkgrel=1
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
source=("https://github.com/tlwg/ibus-libthai/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7a0031b6d8f0b8a883a08b8996ea0e4c9768b456497ba64e98981d885080c31d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
