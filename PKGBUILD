# Maintainer: Chris <christopher.r.mullins g-mail>

pkgname=lightscreen
pkgver=2.0
pkgrel=1
pkgdesc='Simple tool to automate the tedious process of saving and cataloging screenshots'
arch=('i686' 'x86_64')
url='http://lightscreen.com.ar/'
depends=('qt4')
license=('GPL')
source=("lightscreen-$pkgver.tar.gz::https://github.com/ckaiser/Lightscreen/archive/v$pkgver.tar.gz")
sha512sums=('b2ce92eb1f09ef447d407ea64c9b5658223230bf91def1327acebd83e343aa94385d7b1c48dcb8ae0be90bf6eb8133d4781e7cb5f5b5934f017af8ffa1133112')

build() {
  cd "Lightscreen-$pkgver"
  qmake-qt4
  make
}

package() {
  install -D -m755 "Lightscreen-$pkgver/lightscreen" "$pkgdir/usr/bin/lightscreen" 
}
