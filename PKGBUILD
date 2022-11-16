# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dde-kwin-reborn
pkgver=5.6.5
pkgrel=1
pkgdesc='KWin configures on DDE'
arch=('x86_64')
url="https://github.com/linuxdeepin/dde-kwin"
license=('GPL3')
depends=('deepin-qt5integration' 'deepin-wallpapers' 'kwin')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("$pkgname-$pkgver-deepin.tar.gz::https://github.com/justforlxz/dde-kwin/archive/$pkgver.tar.gz")
sha512sums=('61851376f003c9f7d6316dbd47edea392037a7ad7c89fc8419cffe19aab2500052f7b7239af66b569052424ce9c5fa94e12b333e4b5d7236f61e8cd8b1997548')

build() {
  cd dde-kwin-$pkgver
  cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd dde-kwin-$pkgver
  DESTDIR="$pkgdir" ninja install
  chmod +x $pkgdir/usr/bin/kwin_no_scale
}
