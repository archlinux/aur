# Maintainer: Carl George < arch at cgtx dot us >

_name="cliff"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.12.0"
pkgrel="2"
pkgdesc="Command Line Interface Formulation Framework"
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
sha256sums=('7609abc1789522fc4e228ea5567a9fd1db3963850396178adca3332cdd9c929a')

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
