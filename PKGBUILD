# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-gs-quant
_pkgname=gs_quant
pkgver=1.0.57
pkgrel=1
pkgdesc="A python toolkit for quantitative finance developped at Goldman Sachs"
arch=('any')
url="https://developer.gs.com/discover/products/gs-quant"
license=('Apache')
depends=(python
    python-aenum
    python-asteval
    python-backoff
    python-cachetools
    python-certifi
    python-dataclasses-json
    python-dateutil
    python-deprecation
    python-httpx
    python-inflection
    python-lmfit
    python-more-itertools
    python-msgpack
    python-nest-asyncio
    python-opentracing
    python-pandas
    python-pydash
    python-requests
    python-scipy
    python-statsmodels
    python-tqdm
    python-websockets
)
optdepends=()
makedepends=('python-setuptools')
#checkdepends=('python-testfixtures' 'python-pytest' 'python-pytest-mock')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('98886131cfd751681c72e227e3d69a1f62bb1f75d386b3ab1f6868244d18b246')

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
