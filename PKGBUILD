# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.stimage
pkgname=python-${_pyname}-doc
pkgver=0.2.4
pkgrel=1
pkgdesc="Documentation for STScI Image"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD')
makedepends=("python2-${_pyname}=${pkgver}" 'python2-numpydoc' 'python2-stsci.sphinxext')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('29f880d1db686c4c605db8ab8926f56d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make SPHINXBUILD=sphinx-build2 html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
