pkgname='heluxup'
_name='heluxup'
pkgver='0.2.0'
pkgrel=1
pkgdesc="heluxup makes it easy to upgrade HelmRelease objects in a flux control respository."
url="https://github.com/ekeih/heluxup"
depends=('python' 'python-click' 'python-ruamel-yaml' 'python-semver' 'python-urllib3')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('27b7b5f609491d084411623c9623caf34371887b12120e8c64575c66e948a187')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
