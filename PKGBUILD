# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dev-tools
pkgname=${_pkgname}-devel
pkgver=4.13.0
pkgrel=1
pkgdesc="Xfce developer tools"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('gtk-doc' 'automake' 'make' 'intltool' 'pkg-config')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('d24d4db2151a35324c672d4596a6a256f7d92727fe6a9d23648ab53f5207ba3b')

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
