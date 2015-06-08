# Maintainer: Carl George < arch at cgtx dot us >

_name="click"

pkgname=("python-${_name}" "python2-${_name}")
pkgver="4.0"
pkgrel="2"
pkgdesc="A simple wrapper around optparse for powerful command line utilities."
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("python-pytest" "python2-pytest")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f49e03611f5f2557788ceeb80710b1c67110f97c5e6740b97edf70245eea2409')

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py test
    python2 setup.py test
}

package_python-click() {
    depends=("python>=3.3")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-click() {
    depends=("python2>=2.6")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
