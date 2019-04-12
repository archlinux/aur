# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=clr-wallpapers
pkgver=7
pkgrel=1
pkgdesc="Custom wallpapers for clearlinux"
arch=('any')
url="https://github.com/clearlinux/clr-wallpapers"
license=('custom:Distributable')
makedepends=('autogen')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/clearlinux/clr-wallpapers/archive/v$pkgver.tar.gz")
sha256sums=('c812d6bbaac69f3483f3f3b1fd6cffe63aafad7786c63e5ac0e11059626e0a51')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="${pkgdir}/" install
}
