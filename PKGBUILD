# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-gs-quant
_pkgname=gs_quant
pkgver=0.8.348
pkgrel=1
pkgdesc="A python toolkit for quantitative finance developped at Goldman Sachs"
arch=('any')
url="https://developer.gs.com/discover/products/gs-quant"
license=('Apache')
depends=('python' 'python-aenum' 'python-backoff' 'python-cachetools' 'python-funcsigs' 'python-inflection' 'python-lmfit' 'python-msgpack' 'python-pandas' 'python-pydash' 'python-requests' 'python-scipy' 'python-statsmodels')
optdepends=()
makedepends=('python-setuptools')
checkdepends=('python-testfixtures' 'python-pytest' 'python-pytest-mock')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('257a6eaa4c1ae70a03df2a8ec6442cd3f99610403af2d27ba6d055b22aabd0fd')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

#check() {
  #cd "$_pkgname-$pkgver"
  #pytest gs_quant/test
#}
# vim:ts=2:sw=2:et:
