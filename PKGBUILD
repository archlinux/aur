# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=kile21
_pkgname=kile
pkgver=2.1.3
pkgrel=2
pkgdesc="A user friendly TeX/LaTeX frontend for KDE"
arch=("i686" "x86_64")
license=('GPL2')
url="https://kile.sourceforge.net/"
depends=('automoc4' 'ktexteditor' 'kinit' 'okular' 'khtml' 'kdelibs')
makedepends=('extra-cmake-modules' 'kdoctools')
optdepends=('konsole: embedded terminal')
source=("https://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.bz2")
sha1sums=('1a80748d5f01f359b5e5c28140ec90691f0166c5')

build() {
  mkdir build
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
