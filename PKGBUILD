# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-jupyter-dash
_pkgname=jupyter-dash
pkgver=0.4.0
pkgrel=1
pkgdesc="Plotly Dash apps interactively from within Jupyter"
arch=('any')
url="https://github.com/plotly/jupyter-dash"
license=('MIT')
depends=('ipython' 'python' 'python-ansi2html' 'python-dash' 'python-flask' 'python-retrying' 'python-ipykernel' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('eb5eb42ec8cb5e3388d41d895b5ef6e66812e3345cb271cc374318a1a589e687')

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
