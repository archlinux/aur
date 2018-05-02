# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=qservicemenuconfig
pkgver=0.1.1
pkgrel=2
pkgdesc="MenuEditor for Dolphin"
arch=('x86_64')
url="https://www.opendesktop.org/s/Apps/p/1215612/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
source=("https://download.opensuse.org/repositories/home:/wusel1007/openSUSE_42.1/src/QServiceMenuConfig-$pkgver-69.1.src.rpm")
sha256sums=('7ecfaa4b713ddaca0991f68bddb801867be161731ebc7365025a87c884f77aa5')

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
