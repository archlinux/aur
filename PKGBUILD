# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Yi Dai <plmday_at_gmail_dot_com>

pkgname=flwm-tc
_pkgname=flwm
pkgver=1.16
pkgrel=1
pkgdesc="Fast Light Window Manager"
arch=('i686' 'x86_64')
url="http://flwm.sourceforge.net/"
license=('GPL')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('fltk')
source=(https://github.com/bbidulock/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tgz)
md5sums=('00f543bb1734a06eda4680ae86beef9d')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 flwm "${pkgdir}/usr/bin/flwm"
  install -Dm644 flwm.1 "${pkgdir}/usr/share/man/man1/flwm.1"
  install -Dm644 flwm.desktop "$pkgdir/usr/share/xsessions/flwm.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/flwm.png"
}

# vim:set ts=2 sw=2 et:
