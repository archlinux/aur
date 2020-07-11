# Maintainer: George C. Privon <accounts5 at privon dot com>

_pyname=corner
pkgname=python-${_pyname}
pkgver=2.1.0
pkgrel=1
pkgdesc='Make some beautiful corner plots of samples'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-matplotlib' 'python-pytest' 'python-nose' 'python-pandas' 'python-setuptools-scm' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('38f04719d1ab21d10e532f6d368ad22a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
