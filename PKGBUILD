# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-gs-quant
_pkgname=gs_quant
pkgver=0.9.13
pkgrel=1
pkgdesc="A python toolkit for quantitative finance developped at Goldman Sachs"
arch=('any')
url="https://developer.gs.com/discover/products/gs-quant"
license=('Apache')
depends=('python' 'python-aenum' 'python-backoff' 'python-cachetools' 'python-dataclasses-json' 'python-funcsigs' 'python-inflection' 'python-lmfit' 'python-msgpack' 'python-pandas' 'python-pydash' 'python-requests' 'python-scipy' 'python-statsmodels<1.3.0')
optdepends=()
makedepends=('python-setuptools')
checkdepends=('python-testfixtures' 'python-pytest' 'python-pytest-mock')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('35e3d0c2845a412597dca823e9de4b82d39984e5eb8281ac6e8c8d0fa69e3305')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

#check() {
  #git clone https://github.com/goldmansachs/gs-quant.git
  #cp -r gs-quant/gs_quant/test/resources $_pkgname-$pkgver/gs_quant/test/
  #cd "$_pkgname-$pkgver"
  #pytest gs_quant/test
#}
