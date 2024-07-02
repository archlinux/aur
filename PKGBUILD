# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=stsci.tools
pkgname=python-${_pyname}-doc
pkgver=4.1.1
pkgrel=1
pkgdesc="Documentation for STScI utility functions"
arch=('any')
url="https://stscitools.readthedocs.io"
license=('BSD-3-Clause')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('3c5c2e20ba3854556ef70c5ace0a9e8a')

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
