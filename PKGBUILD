# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=acstools
pkgname=python-${_pyname}-doc
pkgver=3.7.0
pkgrel=1
pkgdesc="Documentation for Python ACS Tools"
arch=('any')
url="https://acstools.readthedocs.io"
license=('BSD')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-scikit-image')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('641cdcdb32cf2d852975b23becf9fa8b')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/doc/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
}
