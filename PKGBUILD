# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-gs-quant
_pkgname=gs_quant
pkgver=0.9.101
pkgrel=1
pkgdesc="A python toolkit for quantitative finance developped at Goldman Sachs"
arch=('any')
url="https://developer.gs.com/discover/products/gs-quant"
license=('Apache')
depends=('python' 'python-aenum' 'python-backoff' 'python-cachetools' 'python-dataclasses-json' 'python-funcsigs' 'python-inflection' 'python-lmfit' 'python-msgpack' 'python-opentracing' 'python-pandas' 'python-pydash' 'python-requests' 'python-scipy' 'python-statsmodels')
optdepends=()
makedepends=('python-setuptools')
#checkdepends=('python-testfixtures' 'python-pytest' 'python-pytest-mock')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('a723b3ae40c767b221661e7a30d669927ba03abbb34db40533320f00f37bdf92')

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
