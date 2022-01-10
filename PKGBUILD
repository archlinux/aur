# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling'
pkgname=python-${_pkgname,,}
pkgver=1.9.2
pkgrel=1
pkgdesc="A powerful collection of arbitrary useful classes, decorators, meta-classes and exceptions"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python' 'python-ruamel-yaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=('python-pytooling-packaging')
replaces=('python-pytooling-packaging')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5e7de7a69e70e1760f2a1b03da392847225d9bd1751d77221861466777307cb2')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check(){
  cd "$_pkgname-$pkgver"
  pytest tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
