# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-indicator-applet
pkgver=0.5
pkgrel=1
pkgdesc="Application Indicator Applet for the budgie-desktop"
url='https://github.com/UbuntuBudgie/budgie-indicator-applet'
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('budgie-desktop' 'ido' 'libindicator-gtk3' 'libpeas')
makedepends=('gobject-introspection' 'gtk3' 'intltool' 'libtool')

source=("https://github.com/UbuntuBudgie/budgie-indicator-applet/archive/v${pkgver}.tar.gz")
sha512sums=('a608b946b20bd5fd2bb8e57dca874ef76545b42229a866b734f127f7539f209c2a1b7665a81afba4500c62288eabf881c9179a77817a65c92321fe699d0aa97c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
