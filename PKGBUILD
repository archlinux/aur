# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=astropy-helpers
pkgname=python-${_pyname}-doc
pkgver=3.1.1
pkgrel=1
pkgdesc="Documentation for Astropy helpers"
arch=(any)
url="https://astropy-helpers.readthedocs.io/"
license=('BSD')
makedepends=('python-sphinx-astropy')
source=("https://github.com/astropy/astropy-helpers/archive/v${pkgver}.tar.gz")
md5sums=('69be038c5b31aa43b41470ec9e6e9f41')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
