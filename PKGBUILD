# Maintainer: Brian Bidulock <bidulock at openss7 dot org>

pkgname=xdm-unexicon-theme
pkgver=1.3
pkgrel=1
pkgdesc="Unexicon Live theme for XDM"
arch=(any)
license=('AGPL3')
url="http://www.unexicon.com/"
depends=('xorg-xdm' 'xorg-xclock' 'xorg-xmessage' 'hsetroot' 'gchooser' 'numlockx')
#install="${pkgname}.install"
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('e4de6d015c5f294a33035e4fe59fa812')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
