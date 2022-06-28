# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.ndimage
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python2-${_pyname}")
pkgver=0.10.3
pkgrel=1
pkgdesc="Various functions for multi-dimensional image processing"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/stsci.ndimage"
license=('BSD')
makedepends=('python-setuptools'
#            'python2-setuptools'
             'python-numpy'
#            'python2-numpy'
             'python-d2to1'
#            'python2-d2to1'
#            'python2-stsci.distutils'
             'python-stsci.distutils')
checkdepends=('python-nose')
#'python2-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/stsci.ndimage/master/LICENSE.txt")
md5sums=('de9adde38b8f83d02cbe1460e004b9e1'
         '35b5198447c00d3274a4a2f2c6732e97')

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

#package_python2-stsci.ndimage() {
#    depends=('python2-numpy')
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
#    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#}

package_python-stsci.ndimage() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
