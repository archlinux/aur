# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=tr-patcher
pkgver=1.0.3
pkgrel=1
pkgdesc="A tool to patch Morrowind plugins that target old versions of Tamriel Rebuilt"
provides=('tr-patcher')
conflicts=('tr-patcher')
arch=(any)
url="https://gitlab.com/bmwinger/tr-patcher"
license=(GPL3)
depends=('java-runtime')
makedepends=('gradle')
source=("https://gitlab.com/bmwinger/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('dd04ce39f11f48b635d4d730c330c07d1acc25185c5ac1e07df87bb8d3290fcdf2d6df9aed774ec5260fbc7f42c22fe42b286203be5b237028f26bab4f6029f9')

build() {
  cd $pkgname-v$pkgver
  TERM=xterm gradle build
}

package() {
  cd $pkgname-v$pkgver
  ./install.sh $pkgdir/usr
}
