# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=sncosmo
pkgname=python-${_pyname}-doc
pkgver=1.8.0
pkgrel=1
pkgdesc="Documentation for SNCosmo"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io/"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}" 'python-numpydoc' 'python-sphinx_rtd_theme' 'python-sphinx-gallery' 'python-iminuit')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('09a3c9100ed1be411e832be2fb18c8d7')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
