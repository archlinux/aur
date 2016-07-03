# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=bdsup2subpp-git
pkgver=1.0.2.5.g8245aa8
pkgrel=1
pkgdesc="Subtitle conversion tool for image based stream formats with scaling capabilities and some other nice features. (GIT version)"
arch=('i686' 'x86_64')
license=('Apache')
url='http://forum.doom9.org/showthread.php?t=167051'
depends=('libqxt')
makedepends=('git'
             'cmake'
             )
provides=('bdsup2subpp')
conflicts=('bdsup2subpp')
source=('git+https://github.com/darealshinji/BDSup2SubPlusPlus.git')
md5sums=('SKIP')
_gitname="bdsup2subpp"

pkgver() {
  cd BDSup2SubPlusPlus
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd BDSup2SubPlusPlus/src

  qmake-qt4
  make
}

package() {
  cd BDSup2SubPlusPlus/src
  install -Dm755 bdsup2sub++ "${pkgdir}/usr/bin/bdsup2subpp"

  install -Dm644 ../desktop/bdsup2sub++.1 "${pkgdir}/usr/share/man/man1/bdsup2subpp.1"
  install -Dm644 ../desktop/bdsup2sub++.desktop "${pkgdir}/usr/share/applications/bdsup2subpp.desktop"
  install -Dm644 ../desktop/bdsup2subpp.png "${pkgdir}/usr/share/pixmaps/bdsup2subpp.png"
}
