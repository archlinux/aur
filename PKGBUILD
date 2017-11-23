# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=alexandra
pkgver=1.5.1
pkgrel=1
pkgdesc="A small and user friendly opensource video library with great potential"
arch=('i686' 'x86_64')
url="http://melnik.solutions/project/alexandra"
license=('GPL2')
depends=('hicolor-icon-theme' 'libmediainfo' 'qt5-base')
makedepends=('qt5-tools' 'qt5-translations')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eugene-melnik/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('fccddf62d46f0b0eb5a2019f1fcc70aa64d99d71cfca73e82b662abd81622cb3')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 PREFIX=/usr alexandra.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
