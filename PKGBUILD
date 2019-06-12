# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python-prospector
_pkgname=prospector
pkgver=1.1.6.4
pkgrel=1
pkgdesc="Python static analysis tool"
arch=('any')
depends=('python-pylint-celery'
         'python-pylint-flask'
         'python-pylint-django'
         'python-requirements-detector'
         'python-setoptconf'
         'python-dodgy'
         'python-pyaml'
         'python-pycodestyle'
         'python-pep8-naming'
         'python-pydocstyle')
makedepends=('python-setuptools')
optdepends=('python-pyroma: check setup.py'
            'python-vulture: find dead code'
            'python-mypy: optional type checking')
url="https://github.com/PyCQA/prospector"
license=('GPL2')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('93308a12e8132f4c8c5ee25fa7548230')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
