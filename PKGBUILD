# Maintainer: gkmcd <g@dramati.cc>

pkgname=('python-pyscaffold')
pkgver=3.1
pkgrel=3
pkgdesc="Python project template generator with batteries included"
url="https://pyscaffold.org/"
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools-scm' 'git')
optdepends=('python-django: Scaffold Django projects.'
            'python-cookiecutter: Create custom scaffold templates.'
            'python-pre-commit: Use Git pre-commit hooks.'
            'python-sphinx: Support building documentation with Sphinx.'
            'python-pytest: Use the integrated unit testing.'
            'python-pytest-runner: Use the integrated unit testing.'
            'python-pytest-cov: Generate a coverage report for your project.')
makedepends=('git' 'python-wheel')
source=("pyscaffold-${pkgver}::git+https://github.com/blue-yonder/pyscaffold.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}"/pyscaffold-$pkgver
  python setup.py build
}

package_python-pyscaffold() {
  cd "${srcdir}/pyscaffold-$pkgver"
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
