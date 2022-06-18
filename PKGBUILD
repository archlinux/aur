# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-logilab-sphinx-themes
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python2-${_pyname}")
pkgver=0.2.0
pkgrel=1
pkgdesc="Sphinx themes for Logilab documents"
arch=('i686' 'x86_64')
url="https://www.logilab.org/project/logilab-sphinx-themes"
license=('BSD')
makedepends=('python-setuptools')
#'python2-setuptools')
checkdepends=('python-sphinx')
#'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d2af41df48e92b672b42877bd481aabe')

#prepare() {
#    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
#}

build() {
#   msg "Building Python2"
#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py build

#   msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   msg "Checking Python3"
    python setup.py test

#   msg "Checking Python2"
#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
}

#package_python2-logilab-sphinx-themes() {
#    depends=('python2-sphinx')
#    cd ${srcdir}/${_pyname}-${pkgver}-py2
#
#    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
#    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#}

package_python-logilab-sphinx-themes() {
    depends=('python-sphinx')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
