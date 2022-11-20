# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python38-livereload
pkgver=2.6.3
pkgrel=2
pkgdesc='livereload server in python38 3.8'
arch=('any')
url='https://github.com/lepture/python38-livereload'
license=('BSD')
depends=('python38' 'python38-tornado')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ccccb17cb4d835eb9e812f8076f871164f6afb2fdc1aee9e35c5ef2d75be2c0403cee51d4eb30b029d7b35522f357ee8c3e9df926fd93511ba7d010ed2a69e8e')

build() {
  cd $pkgname-$pkgver

  python3.8 setup.py build
}

#check() {
#  cd $pkgname-$pkgver
#
#  python3.8 -m pytest
#}

package() {
  cd $pkgname-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
