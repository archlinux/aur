# Maintainer: Jonas DOREL <jonas at dorel dot me>

pkgbase='python-prospector'
pkgname=('python-prospector')
_module='prospector'
pkgver='1.6.0'
pkgrel=2
pkgdesc="Python static analysis tool"
url="http://prospector.readthedocs.io"
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
         'python-toml'
         'python-setoptconf-tmp')
optdepends=('python-bandit: security linter'
            'python-frosted: checker'
            'mypy: optional type checking'
            'python-pyroma: check setup.py'
            'python-vulture: find dead code')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1ca0da95a2d1a151ae578f02d6fc78300a9150af8f2c2c201097213016cc92ee')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
