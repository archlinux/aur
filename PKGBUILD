# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=sncosmo
pkgname=python-${_pyname}-doc
pkgver=2.9.0
pkgrel=1
pkgdesc="Documentation for SNCosmo"
arch=('any')
url="https://sncosmo.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'python-numpydoc'
             'python-sphinx_rtd_theme'
             'python-sphinx-gallery'
             'python-iminuit'
             'graphviz')
source=("https://github.com/sncosmo/sncosmo/archive/v${pkgver}.tar.gz")
md5sums=('e98a9fd0ca006e14640c7167933a801c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
}
