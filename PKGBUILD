# Contributor: Patrick Mischke

pkgname='python-pyjson5'
_name='pyjson5'
pkgver=1.6.2
pkgrel=1
pkgdesc="A JSON5 serializer and parser library for Python 3 written in Cython."
url="https://github.com/Kijewski/pyjson5"
depends=('cython' 'python-more-itertools')
makedepends=('python-build' 'python-colorama' 'python-docutils' 'python-setuptools' 'python-sphinx' 'python-sphinx-autodoc-typehints' 'python-sphinx_rtd_theme' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('227a1e5eff5c570281a9154002ad4e15dcbe7c93334fc1b8f3cd132481382a33')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
