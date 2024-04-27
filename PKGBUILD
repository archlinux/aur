# Maintainer: Mufeed Ali <mufeed@kumo.foo>
# ex-Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>

pkgbase='python-wn'
pkgname=python-wn
_author=goodmami
_gitname=wn
pkgver=0.9.5
pkgrel=1
pkgdesc="Wordnet interface library"
arch=('any')
url='https://github.com/goodmami/wn'
license=('MIT')
depends=('python' 'python-tomli' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-flit')
source=("https://files.pythonhosted.org/packages/a7/05/278cb587ad052681a8a8092af8c28a8e802397d5c35f530a79cf913c66cf/${_gitname}-${pkgver}.tar.gz")
sha256sums=('9ae62e0e6607f56e63e9eb8360930c8337ecc44e9e0488430aa1fa3fb9c51be4')

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
