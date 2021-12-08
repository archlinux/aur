# Maintainer: Jezer Mejía <amyuki4@gmail.com>

pkgname=web-greeter
pkgver=3.2.0
pkgrel=1
pkgdesc='A modern, visually appealing greeter for LightDM'
arch=('x86_64')
url='https://github.com/JezerM/web-greeter'
license=('GPL3')
depends=('lightdm' 'python3' 'python-gobject' 'python-pyqt5' 'qt5-webengine' 'gobject-introspection')
makedepends=('rsync' 'zip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('aa9a24a54f1d1becc33d7b1d5f90fd8960ca94372648c665a7858a8d546b932c2f3e9ce158cae6530f439a9fe85861769e26933fe043ef8b6914bd71384bf15f')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" make install
}
