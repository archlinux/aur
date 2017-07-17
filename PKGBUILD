# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=fotowall
pkgver=1.0
pkgrel=1
pkgdesc="A creative tool that allows you to layout your photos or pictures in a personal way"
arch=('i686' 'x86_64')
url="http://www.enricoros.com/opensource/fotowall/"
license=('LGPL3')
depends=('desktop-file-utils' 'qt5-svg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/enricoros/fotowall/archive/v$pkgver.tar.gz")
sha256sums=('8dc42262dd5220a12e92181ff82bd363a6506a4c3ab1ea3841281f2971e1b289')

build() {
  cd $pkgname-$pkgver
  sed -i 's|Icon=fotowall|Icon=/usr/share/pixmaps/fotowall.png|' $pkgname.desktop
  qmake-qt5 PREFIX=/usr $pkgname.pro
  make
}

package() {
  make -C $pkgname-$pkgver INSTALL_ROOT="${pkgdir}/" install
}
