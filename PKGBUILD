# Maintainer: hexchain <i at hexchain dot org>

_pypiname=jupyter_http_over_ws
pkgname=python-jupyter-http-over-ws
pkgdesc="Jupyter support for HTTP-over-ws"
url="https://github.com/googlecolab/jupyter_http_over_ws"
license=('Apache')
arch=('any')
pkgver=0.0.7
pkgrel=1
depends=('jupyter-notebook' 'python-six' 'python-tornado')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('fd7e3df2dcc3a456db1d30fb5b148d498f67882837e19f11ad4b953bddef9b1d')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --optimize=1 --root="$pkgdir/" --prefix=/usr --skip-build
}
