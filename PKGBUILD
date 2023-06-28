# Contributor: jmcb <joelsgp@protonmail.com>
# Contributor: Jonas DOREL <jonas at dorel dot me>

pkgname=python-prospector
_name=prospector
pkgver=1.10.2
pkgrel=1
pkgdesc="Python static analysis tool"
url="https://github.com/PyCQA/prospector/"
depends=('python-pylint'
         'python-pylint-celery'
         'python-pylint-django'
         'python-pylint-plugin-utils'
         'python-pylint-flask'
         'python-requirements-detector'
         'python-yaml'
         'python-mccabe'
         'python-pyflakes'
         'python-pycodestyle'
         'python-pep8-naming'
         'python-pydocstyle'
         'python-dodgy'
         'python-toml'
         'python-setoptconf'
         'python-gitpython'
         'python-packaging')
optdepends=('python-bandit: security linter'
            'mypy: optional type checking'
            'python-pyroma: check setup.py'
            'python-vulture: find dead code')
makedepends=('python-poetry'
             'python-wheel')
license=('GPL2')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('599f31516f857d785058773875e9358702ad653e65461e8cad44134d8ee17b1f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
