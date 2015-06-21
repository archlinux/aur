# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname="qt4wvdialer"
pkgver=0.4.4
pkgdesc="A simple graphical frontend to wvdial, ported to Qt4."
pkgrel=3
arch=('i686' 'x86_64')
url="http://github.com/schuay/${pkgname}"
license=('GPL')
depends=('qt4' 'wvdial')
source=("https://github.com/downloads/schuay/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.desktop")
md5sums=('2580a9dfdb10a083e3160f890d392b74'
         'e6530cad1fb85453a85c8c9e53d16a91')

build() {
  cd ${srcdir}

  ./configure --prefix=/usr
  make
}
package() {
  cd ${srcdir}

  install -D -m755 bin/qtwvdialer ${pkgdir}/usr/bin/qtwvdialer
  install -D -m644 ${srcdir}/${pkgname}.desktop \
      ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

