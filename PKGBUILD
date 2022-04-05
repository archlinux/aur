# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jacek Poplawski <jacekpoplawski@gmail.com>
# Contributor: Charlie Cox <ccoxiv@yahoo.com>

pkgname=atanks
pkgver=6.6
pkgrel=1
pkgdesc="Atomic Tanks"
url="http://atanks.sourceforge.net"
license=('GPL')
arch=('x86_64')
depends=('allegro4' 'gcc-libs')
source=("http://downloads.sourceforge.net/project/atanks/atanks/atanks-${pkgver}/atanks-${pkgver}.tar.gz")
sha256sums=('bc6b1efc9fc7e7624fad1d8352d72e927be0fba2160bb25bb6b8bd6c6370bf43')

build() {
  cd atanks-${pkgver}
  make
}

package() {
  cd atanks-${pkgver}
  make DESTDIR="$pkgdir" INSTALL="install -c" install

  sed -i 's/^Name=atanks/Name=Atomic Tanks/' atanks.desktop
  sed -i 's/^Categories=Game;/Categories=Game;StrategyGame;/' atanks.desktop

  install -Dm644 atanks.desktop "$pkgdir"/usr/share/applications/atanks.desktop
  install -Dm644 atanks.png "$pkgdir"/usr/share/pixmaps/atanks.png
}
