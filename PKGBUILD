# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=xdm-unexicon-theme
pkgver=1.4
pkgrel=1
pkgdesc="Unexicon Live theme for XDM"
arch=(any)
license=('AGPL3')
url="http://www.unexicon.com/"
depends=('xorg-xdm' 'xorg-xclock' 'xorg-xmessage' 'hsetroot' 'gchooser' 'numlockx')
#install="${pkgname}.install"
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('8e7522d97b1cb71157beb10cb1a43f063126ab31cafee0e9859637ac8720dd02')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package () {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
