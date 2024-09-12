# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=acstools
pkgname=python-${_pyname}-doc
pkgver=3.7.2
pkgrel=1
pkgdesc="Documentation for Python ACS Tools"
arch=('any')
url="https://acstools.readthedocs.io"
license=('BSD-3-Clause')
makedepends=("python-${_pyname}=${pkgver}"
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-scikit-image')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0fa024a07f40b7878581578b242fa02f')

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
