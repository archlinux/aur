# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dev-tools
pkgname=${_pkgname}-devel
pkgver=4.17.0
pkgrel=1
pkgdesc="Xfce developer tools"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('gtk-doc' 'automake' 'make' 'intltool' 'pkg-config')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('d334c1f10e140e666b86c6c3bd8dcd62f1a877f537bcacc974478b6e92c493c7')

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
