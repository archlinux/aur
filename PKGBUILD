# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dev-tools
pkgname=${_pkgname}-devel
pkgver=4.17.1
pkgrel=1
pkgdesc="Xfce developer tools"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('gtk-doc' 'automake' 'make' 'intltool' 'pkg-config')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e9af0efc1acfe443cf513e7f82621f81ef62b50e2bf241096a41b90489ef4f9f')

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
