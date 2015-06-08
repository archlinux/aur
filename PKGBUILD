# Maintainer: Benjamin Bukowski <benjamin.bukowski@googlemail.com>

pkgname=wavbreaker
pkgver=0.11
pkgrel=1
pkgdesc="A GTK wave file splitter"
arch=('x86_64' 'i686')
url="http://wavbreaker.sourceforge.net/"
license=('GPL')
depends=('libpulse' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme')
optdepends=('pulseaudio')
install=$pkgname.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('97f981baa6ca0d4d52b88314defeea4c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
