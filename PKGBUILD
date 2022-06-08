# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.imagemanip
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python2-${_pyname}")
pkgver=1.1.4
pkgrel=1
pkgdesc="STScI general image manipulation tools"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD')
makedepends=('python-setuptools' 'python-numpy' 'python-d2to1' 'python-stsci.distutils')
checkdepends=('python-stsci.tools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/stsci.imagemanip/master/LICENSE.txt")
md5sums=('cc40be0b4583cfc2afae038af1899731'
         'aba8328694a0d4b8e574c29da48a53b4')

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
#   msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

#   msg "Checking Python2"
#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
}

#package_python2-stsci.imagemanip() {
#    depends=('python2-stsci.tools')
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
#    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#}

package_python-stsci.imagemanip() {
    depends=('python-stsci.tools')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
