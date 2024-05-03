# Maintainer: Letu Ren <fantasquex at gmail dot com>

pkgname=python-gersemi
_name=${pkgname#"python-"}
pkgver=0.12.1
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
sha256sums=('a4c92c1eed5f94b81ed96d15a52417bfeb73ffb6b79b5a73dd1b4b7a104c6f1d')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
