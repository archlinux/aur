# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=2.3.1
pkgrel=1
pkgdesc="A python framework for building analytical web applications"
arch=('any')
url="https://plot.ly/products/dash/"
license=('MIT')
depends=('python' 'python-flask' 'python-flask-compress' 'python-flask-seasurf' 'python-future' 'python-plotly' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
provides=('python-dash-core-components' 'python-dash-html-components' 'python-dash-renderer' 'python-dash-table')
conflicts=('python-dash-core-components' 'python-dash-html-components' 'python-dash-renderer' 'python-dash-table')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('07f59e2ebec62c9123a8d8ccfd9c57c73095080b5cbfb3bb44f27ce0b228b4ef')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

## vim:ts=2:sw=2:et:
