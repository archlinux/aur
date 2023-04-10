# Contributor: 	xantares
# Maintainer: asuka minato
pkgname=python-doc2dash
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="Create docsets for Dash.app-compatible API browser."
url="https://doc2dash.readthedocs.io/en/stable/"
arch=(any)
license=('MIT')
makedepends=(python-hatch-vcs python-hatch-fancy-pypi-readme python-build python-installer python-wheel python-hatchling)
depends=('python' 'python-sphinx' 'python-attrs' 'python-beautifulsoup4' 'python-click' 'python-colorama' 'python-lxml' 'python-six' 'python-zope-interface')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
provides=('python-doc2dash')
sha256sums=('5456ee60cce489dd03f6e236b2d997f949d17de3a0fce5e6be3c262493efa1ee')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

