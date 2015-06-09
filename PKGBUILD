# Maintainer: Carl George < arch at cgtx dot us >

_name="cliff"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.13.0"
pkgrel="1"
pkgdesc="Command Line Interface Formulation Framework"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2b92d12cf1aa59c0cf1914b4b6b02b78daadac890a53d0e6b71b5220661ab9e0')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
}

package_python-cliff() {
    depends=("python-cmd2>=0.6.7"
             "python-prettytable>=0.7"
             "python-pyparsing>=2.0.1"
             "python-six>=1.9.0"
             "python-stevedore>=1.3.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-cliff() {
    depends=("python2-cmd2>=0.6.7"
             "python2-prettytable>=0.7"
             "python2-pyparsing>=2.0.1"
             "python2-six>=1.9.0"
             "python2-stevedore>=1.3.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
