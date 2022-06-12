# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.convolve
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python2-${_pyname}")
pkgver=2.2.2
pkgrel=1
pkgdesc="Image array convolution functions"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD')
makedepends=('python-setuptools' 'python-numpy' 'python-d2to1' 'python-stsci.distutils')
#checkdepends=('python2-nose')
#             'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/stsci.convolve/master/LICENSE.txt")
md5sums=('fb0feba75f45d85f34d6e4599efcd3db'
         '901964fd100b953a8c8fd4d8f0ae8a7e')

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

#check() {
##   msg "Checking Python3"
##   cd ${srcdir}/${_pyname}-${pkgver}
##   python setup.py test
##   pytest
#
##   msg "Checking Python2"
##   cd ${srcdir}/${_pyname}-${pkgver}-py2
##   python2 setup.py test
#}

#package_python2-stsci.convolve() {
#    depends=('python2-numpy')
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
#    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#}

package_python-stsci.convolve() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
