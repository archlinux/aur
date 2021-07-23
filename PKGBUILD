# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyExceptions'
pkgname=python-${_pkgname,,}
pkgver=1.1.1
pkgrel=2
pkgdesc="An exception base-class to derive more powerful exceptions"
arch=(any)
url="https://github.com/Paebbels/pyExceptions"
license=('Apache')
depends=('python' 'python-sphinxextensions' 'python-pydecor')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9ba0e45c05e3afa2caf770648889266179c84c633ce08b96cb30bcfeedda5d5b')

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
