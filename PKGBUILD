# Maintainer: Hakan Erduman <hakan at erduman dot de>
pkgname=xfce4-hamster-plugin
pkgver=1.8
pkgrel=1
pkgdesc="A recreation of the gnome-shell hamster extension as a xfce4 panel plugin."
url="https://github.com/projecthamster/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xfce4-panel' 'hamster-time-tracker')
makedepends=('pkgconfig' 'intltool' )
source=("https://github.com/projecthamster/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0802f8a695755153a2f89f7b99767ca7753521dadc3f20a7cec2e09b1b2bb032')

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
