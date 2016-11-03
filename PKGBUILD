# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=sim65
pkgver=1
pkgrel=2
pkgdesc="65c02 simulation system"
arch=('i686' 'x86_64')
url="http://www.wsxyz.net/sim65/"
license=('GPL')
depends=('wxgtk')
source=(http://www.wsxyz.net/${pkgname}/${pkgname}.tar.gz
        wx3.patch)
md5sums=('b83a86302e55763e280638676715c391'
         'ba0b33c3e37c1c8a7d80ab135b7bdeb8')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 < "${srcdir}/wx3.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-system"
}

# vim:set ts=2 sw=2 et:
