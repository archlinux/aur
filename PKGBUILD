# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.tools
pkgname=python-${_pyname}-doc
pkgver=4.1.0
pkgrel=1
pkgdesc="Documentation for STScI utility functions"
arch=('any')
url="https://stscitools.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('4fd2c7ad448f0dff3458dd1c2a581241')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
