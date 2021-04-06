# Maintainer: Hakan Erduman <hakan at erduman dot de>
pkgname=xfce4-hamster-plugin
pkgver=1.14
pkgrel=1
pkgdesc="A recreation of the gnome-shell hamster extension as a xfce4 panel plugin."
url="https://github.com/projecthamster/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xfce4-panel' 'hamster-time-tracker')
makedepends=('pkgconfig' 'intltool' )
source=("https://github.com/projecthamster/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('50ba2182a5fd0434ff7994759442165471155f2c72b53d1ebef6044e76446ff0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-silent-rules -silent --with-icon_name=hamster-time-tracker
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
