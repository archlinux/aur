# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=astropy-helpers
pkgname=python-${_pyname}-doc
pkgver=4.0
pkgrel=1
pkgdesc="Documentation for Astropy helpers"
arch=(any)
url="https://astropy-helpers.readthedocs.io/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx-astropy')
source=("https://github.com/astropy/astropy-helpers/archive/v${pkgver}.tar.gz")
md5sums=('d0ab7da10691eca1859b8de471395ff9')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
