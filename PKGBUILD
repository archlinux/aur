# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=sncosmo
pkgname=python-${_pyname}-doc
pkgver=2.7.0
pkgrel=1
pkgdesc="Documentation for SNCosmo"
arch=('any')
url="https://sncosmo.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc' 'python-sphinx_rtd_theme' 'python-sphinx-gallery' 'python-iminuit' 'graphviz')
source=("https://github.com/sncosmo/sncosmo/archive/v${pkgver}.tar.gz")
md5sums=('d05b2bc505bf55ed9fe94d2e1ed242b5')

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
