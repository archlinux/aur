# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jan Blazek <appolito@gmail.com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>

pkgname=gtkimageview
pkgver=1.6.4
pkgrel=4
pkgdesc="Simple image viewer widget for GTK2"
arch=('i686' 'x86_64')
url="https://github.com/GNOME/gtkimageview"
license=('LGPL2.1')
depends=('gtk2')
makedepends=('pkg-config')
source=("ftp://ftp.archlinux.org/other/packages/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('501367b3f50e69a12208dc9c6ad00b18')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --disable-static

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share"
}
