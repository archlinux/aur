# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=quimup
pkgver=1.4.2
pkgrel=1
pkgdesc="A simple Qt5 frontend to MPD"
arch=('i686' 'x86_64')
url="http://coonsden.com/"
license=('GPL2')
makedepends=()
depends=('mpd' 'qt5-base' 'taglib')
source=("http://coonsden.com/dl0ads/${pkgname}_${pkgver}_source.tar.gz")
md5sums=('1dfa7d9679ff18201e102cf42ce35638')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
}

build() {
  cd build
  qmake-qt5 PREFIX=/usr -Wnone "../${pkgname} ${pkgver}/quimup.pro"
  make
}

package() {
  # there is no install target
  install -Dm755 "${srcdir}/build/quimup" "${pkgdir}/usr/bin/quimup"
}

