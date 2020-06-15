# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-indicator-applet
pkgver=0.6.2
pkgrel=1
pkgdesc="Application Indicator Applet for the budgie-desktop"
url='https://github.com/UbuntuBudgie/budgie-indicator-applet'
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('budgie-desktop' 'ido' 'libindicator-gtk3' 'libpeas')
makedepends=('gobject-introspection' 'gtk3' 'intltool' 'libtool')

source=("https://github.com/UbuntuBudgie/budgie-indicator-applet/archive/v${pkgver}.tar.gz")
sha512sums=('7faaad7418d4df7eaef675c281c1fc09f06eb979f6e3662e9e757628ea7d94c24264d15a4c9f2b70cf78a259b11881903c3e43a56150b800307e25decdd95b99')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
