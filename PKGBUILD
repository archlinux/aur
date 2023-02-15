# Maintainer: jmcb <joelsgp@protonmail.com>
# Contributor: Jonas DOREL <jonas at dorel dot me>

pkgname='python-prospector'
_name='prospector'
pkgver='1.6.0'
pkgrel=5
pkgdesc="Python static analysis tool"
url="https://github.com/PyCQA/prospector/"
depends=('python-pylint'
         'python-pylint-celery'
         'python-pylint-django'
         'python-pylint-plugin-utils'
         'python-pylint-flask'
         'python-requirements-detector'
         'python-setoptconf'
         'python-yaml'
         'python-mccabe'
         'python-pyflakes'
         'python-pycodestyle'
         'python-pep8-naming'
         'python-pydocstyle'
         'python-dodgy'
         'python-toml')
optdepends=('python-bandit: security linter'
            'python-frosted: checker'
            'mypy: optional type checking'
            'python-pyroma: check setup.py'
            'python-vulture: find dead code')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
license=('GPL2')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1ca0da95a2d1a151ae578f02d6fc78300a9150af8f2c2c201097213016cc92ee')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
