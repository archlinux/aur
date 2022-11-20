# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-webcolors
pkgver=1.12
pkgrel=1
pkgdesc="A library for working with color names and color value formats defined by the HTML and CSS specifications for use in documents on the Web"
url="https://github.com/ubernostrum/webcolors"
license=('BSD')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("https://pypi.io/packages/source/w/webcolors/webcolors-$pkgver.tar.gz")
sha512sums=('2c1e46ba2036ff960a973b9f5b4cec06241e9385fa0de876f66a6cf742d5b11bc212fce262011968a612c1446b78a6f50b3e75d04584c3b2b47f3ac3d66fdd51')

build() {
  cd webcolors-$pkgver
  python3.8 setup.py build
}

check() {
  cd webcolors-$pkgver
  python3.8 -B setup.py pytest
}

package() {
  cd webcolors-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
