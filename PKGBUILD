# Maintainer: hexchain <i at hexchain dot org>

_pypiname=jupyter_http_over_ws
pkgname=python-jupyter-http-over-ws
pkgdesc="Jupyter support for HTTP-over-ws"
url="https://github.com/googlecolab/jupyter_http_over_ws"
license=('Apache')
arch=('any')
pkgver=0.0.8
pkgrel=3
depends=('jupyter-notebook' 'python-six' 'python-tornado')
makedepends=('python-setuptools')
source=("https://github.com/googlecolab/$_pypiname/archive/v$pkgver.tar.gz")
sha256sums=('12c1ab1fa764637b7e2e4b214c4dd2c9d890f02101cd1e6410bc7ad534d8155f')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --optimize=1 --root="$pkgdir/" --prefix=/usr --skip-build
}
