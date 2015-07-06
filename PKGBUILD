# Contributor: Erik Johnson <palehose at gmail dot com>

pkgname=('python-hglib' 'python2-hglib')
_srcname=python-hglib
pkgver=1.6
pkgrel=1
pkgdesc="python-hglib is a library with a fast, convenient interface to Mercurial. It uses Mercurial's command server for communication with hg."
url="https://pypi.python.org/pypi/python-hglib"
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/p/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('d3b3d106893dfdfc29492e0a5c9e3c5a98037504a5b4393e7f44c46935cb5f0b')

prepare() {
    cp -a "${srcdir}/${_srcname}-${pkgver}"{,-python2}
}

package_python-hglib() {
    depends=('python' 'mercurial')
    makedepends=('python-setuptools')
    cd "${_srcname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-hglib() {
    depends=('python2' 'mercurial')
    makedepends=('python2-setuptools')
    cd "${_srcname}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
