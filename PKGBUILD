# Maintainer: Jezer Mejía <amyuki4@gmail.com>

pkgname=web-greeter
pkgver=3.3.0
pkgrel=1
pkgdesc='A modern, visually appealing greeter for LightDM'
arch=('x86_64')
url='https://github.com/JezerM/web-greeter'
license=('GPL3')
depends=('lightdm' 'python3' 'python-gobject' 'python-pyqt5' 'python-pyqt5-webengine' 'python-ruamel-yaml' 'python-pyinotify' 'python-xlib' 'qt5-webengine' 'gobject-introspection')
makedepends=('rsync' 'zip' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('af687d6c9b9e9e161708f87aecb10baf9ba614ffc906f26fd7c675c4762f2674ec570bfbbb4f206d3b5a61fff94d331053dccf210db33719054a60b3ee408a5c')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" make install
}
