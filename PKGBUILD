# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

_name='flask-restinpeace'

pkgname="python-${_name}"
pkgver='1.3.0'
pkgrel=1
pkgdesc="Create Flask REST APIs in peace."
arch=('any')
url="https://github.com/kynikos/lib.py.flask-rip"
license=('MIT')
depends=('python-flask-marshmallow'
         'python-apispec'
         'python-apispec-webframeworks'
         # python-yaml is a python-apispec optdepend, but it seems required
         # to use this module?
         # TODO: Report a bug?
         'python-yaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8736202546ab649116298912693839d68c3c8f639b5acb0c230e6aefd5ba4e19')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
