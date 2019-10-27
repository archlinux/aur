# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=astropy-helpers
pkgname=python-${_pyname}-doc
pkgver=3.2.2
pkgrel=1
pkgdesc="Documentation for Astropy helpers"
arch=(any)
url="https://astropy-helpers.readthedocs.io/"
license=('BSD')
makedepends=('python-sphinx-astropy')
source=("https://github.com/astropy/astropy-helpers/archive/v${pkgver}.tar.gz")
md5sums=('40f978d0c5fbd6b605ff759ab82e2b1b')

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
