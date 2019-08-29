# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.5.1
pkgrel=1
pkgdesc="WCS based distortion models and coordinate transformation"
arch=('i686' 'x86_64')
url="https://stwcs.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-relic')
#checkdepends=('python-pytest' 'python-stsci.tools' 'python-lxml')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('b605e2c557f1fffee05a6db53e198b3a')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
#}

package_python-stwcs() {
    depends=('python>=3.5' 'python-stsci.tools>=3.5.2' 'python-requests' 'python-lxml')
    optdepends=('python-stwcs-doc: Documentation for STWCS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
