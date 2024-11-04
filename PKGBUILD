# Maintainer: Letu Ren <fantasquex at gmail dot com>

pkgname=python-gersemi
_name=${pkgname#"python-"}
pkgver=0.17.0
pkgrel=1
pkgdesc="A formatter to make your CMake code the real treasure"
arch=('any')
url="https://github.com/BlankSpruce/gersemi"
license=('mpl-2.0')
depends=(
  'python'
  'python-appdirs'
  'python-lark-parser'
  'python-yaml'
)
makedepends=('python-setuptools')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a419371827b3b8208ea83b4a9c6973889ee2bbc91376eee38584d8507d75ff61')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

