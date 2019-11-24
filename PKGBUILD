pkgname='heluxup'
_name='heluxup'
pkgver='1.0.2'
pkgrel=1
pkgdesc="heluxup makes it easy to upgrade HelmRelease objects in a flux control respository."
url="https://github.com/ekeih/heluxup"
depends=('python' 'python-click' 'python-ruamel-yaml' 'python-semver' 'python-urllib3')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('21a14b5b499ef5865f08ca5c97770ab12a5f15cd8d238374ec7967ee815ba63e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
