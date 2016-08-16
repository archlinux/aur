# Maintainer: Hakan Erduman <hakan at erduman dot de>
pkgname=xfce4-hamster-plugin
pkgver=1.7
pkgrel=1
pkgdesc="A recreation of the gnome-shell hamster extension as a xfce4 panel plugin."
url="https://github.com/projecthamster/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xfce4-panel' 'hamster-time-tracker')
makedepends=('pkgconfig' 'intltool' )
source=("https://github.com/projecthamster/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('045f57a2af7dc32529594c0cf53c56a7f52975824cc8248457157284bdd810be')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-silent-rules -silent --with-icon_name=hamster-time-tracker
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
