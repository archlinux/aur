# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=qservicemenuconfig
pkgver=0.1.2
pkgrel=1
pkgdesc="MenuEditor for Dolphin"
arch=('x86_64')
url="https://www.opendesktop.org/s/Apps/p/1215612/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
source=("https://download.opensuse.org/repositories/home:/wusel1007/openSUSE_42.1/src/QServiceMenuConfig-$pkgver-85.1.src.rpm")
sha256sums=('c292a60c2fb98440aa72be1d7fd222de26af3fed58af8891e11cee03043ece70')

prepare() {
  bsdtar -zxvf "QServiceMenuConfig-$pkgver.tgz"
}

build() {
  cd "QServiceMenuConfig-$pkgver"
  qmake-qt5
  make
}

package() {
  make -C "QServiceMenuConfig-$pkgver" DESTDIR="$pkgdir" install
}
