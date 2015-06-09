# Maintainer: Carl George < arch at cgtx dot us >

_name="os-client-config"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.3.0"
pkgrel="2"
pkgdesc="OpenStack Client Configuation Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr" "python2-pbr")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('247f2245e9a5e389c5049ef90da3fbd3cffe87b7c7b8294a789dc17d51b9fdb6')

package_python-os-client-config() {
    depends=("python-yaml>=3.1.0"
             "python-appdirs>=1.3.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-os-client-config() {
    depends=("python2-yaml>=3.1.0"
             "python2-appdirs>=1.3.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
