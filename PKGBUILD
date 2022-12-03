# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dev-tools
pkgname=${_pkgname}-devel
pkgver=4.17.2
pkgrel=1
pkgdesc="Xfce developer tools"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('gtk-doc' 'automake' 'make' 'intltool' 'pkg-config')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('4501079488ee9eba007c2e2cea67755737faea887cd0e7330cc5fcbf7b397813')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
