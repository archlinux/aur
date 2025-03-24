# Maintainer: Uffe Jakobsen < ._= uffe =_. @ ._= uffe =_. . ._= org =_. >
# Contributor:  TDY <tdy@archlinux.info>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=shed
pkgver=1.16
pkgrel=1
pkgdesc="A simple hex editor with an ncurses, pico-style interface"
arch=('i686' 'x86_64')
url="https://shed.sourceforge.net/"
license=('GPL-2.0-only')
depends=('ncurses')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('39fdf7d1bed6527d801f71b84e505d02e7a931799250f16d36db291e54635883')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make CFLAGS="${CFLAGS}"
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
