# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-ewmh
pkgver=0.1.6
pkgrel=1
pkgdesc="Python implementation of Extended Window Manager Hints, based on Xlib"
url="https://github.com/parkouss/pyewmh"
license=('LGPL')
arch=('any')
depends=('python-xlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/parkouss/pyewmh/archive/v$pkgver.tar.gz")
sha512sums=('257d59c0927cec3cd75a6084cd484f1dcf9fa882719707078398d2a65e95e975ad9f6225ed1fd8ec1a29badbdc492c84eb4e04640cc6b480b31bc5ae8ab3f7c8')

build() {
  cd pyewmh-$pkgver
  python setup.py build
}

package() {
  cd pyewmh-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
