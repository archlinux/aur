# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.distutils
pkgname=python-${_pyname}-doc
pkgver=0.3.7
pkgrel=1
pkgdesc="Documentation for STScI Distutils"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD')
makedepends=("python2-${_pyname}=${pkgver}" 'python2-d2to1' 'python2-stsci.sphinxext')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('cc7617f69c0b10eaecdb529a4bec02b5')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make SPHINXBUILD=sphinx-build2 html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
