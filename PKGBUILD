# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=2.0.0
pkgrel=2
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
sha256sums=('29277c24e2f795b069cb102ce1ab0cd3ad5cf9d3b4fd16c03da9671a5eea28a4')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}
package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

## vim:ts=2:sw=2:et:
