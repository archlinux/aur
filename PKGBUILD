# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-jupyter-dash
_pkgname=jupyter-dash
pkgver=0.4.2
pkgrel=1
pkgdesc="Plotly Dash apps interactively from within Jupyter"
arch=('any')
url="https://github.com/plotly/jupyter-dash"
license=('MIT')
depends=('ipython' 'python' 'python-ansi2html' 'python-dash' 'python-flask' 'python-retrying' 'python-ipykernel' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d546c7c25a2867c14c95a48af0ad572803b26915a5ce6052158c9dede4dbf48c')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}
package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  mv $pkgdir/{usr/etc,etc}
}

## vim:ts=2:sw=2:et:
