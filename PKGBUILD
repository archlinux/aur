# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=otter-browser
pkgver=0.9.12
pkgrel=1
pkgdesc="Browser aiming to recreate classic Opera (12.x) UI using Qt5."
arch=('i686' 'x86_64')
url="http://$pkgname.org"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-webkit' 'hicolor-icon-theme' 'desktop-file-utils' 'hunspell')
makedepends=('cmake' 'qt5-tools')
conflicts=('otter-browser-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/OtterBrowser/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('a9a141506f1ae428b21d69048840621f')

build() {
  cd $pkgname-$pkgver
  lrelease resources/translations/*.ts
  cmake -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
