# Maintainer  : Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gboggle
pkgver=1.1.4
pkgrel=3
pkgdesc="A simple version of the classic game Boggle."
arch=("i686" "x86_64")
url="http://gboggle.sourceforge.net"
license=('GPL')
depends=('gconf' 'gtk2' 'hicolor-icon-theme' 'desktop-file-utils')
source=("http://downloads.sourceforge.net/project/${pkgname}/$pkgver/${pkgname}-${pkgver}.tar.gz")
md5sums=('4eef546c2f851deb6991848646d6d322')
install=$pkgname.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
