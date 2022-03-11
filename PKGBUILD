# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=2.2.0
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
sha256sums=('e88e6615695e83b7a8339301a92700461435fef734b40eca864cff6d853a3b9c')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

## vim:ts=2:sw=2:et:
