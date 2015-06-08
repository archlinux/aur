# Maintainer: Carl George < arch at cgtx dot us >

_name="os-client-config"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.8.0"
pkgrel="2"
pkgdesc="Unified config handling for client libraries and programs"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.6"
             "python-pip"
             "python-setuptools"
             "python2-pbr>=0.6"
             "python2-pip"
             "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6f8bace5f8669a92a80b1611d53676ab24696bc7b68ed5dba3ba4243b5e7ef81')

package_python-os-client-config() {
    depends=("python-yaml>=3.1.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-os-client-config() {
    depends=("python2-yaml>=3.1.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
